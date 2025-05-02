import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../theme/theme.dart';
import '../../services/projects_service.dart';
import '../../models/project_model.dart';

class AllProjectsScreen extends StatefulWidget {
  final String? location;

  const AllProjectsScreen({Key? key, this.location}) : super(key: key);

  @override
  State<AllProjectsScreen> createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends State<AllProjectsScreen> {
  final List<Project> _projects = [];
  bool _isLoading = true;
  String? _error;
  int _page = 1;
  bool _hasMoreData = true;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadProjects();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        _hasMoreData) {
      _loadMoreProjects();
    }
  }

  Future<void> _loadProjects() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final data = await ProjectsService.getProjectsByLocation(
        widget.location ?? 'New Delhi',
      );

      if (mounted) {
        final List<Project> projects =
            (data['projects'] as List)
                .map((json) => Project.fromJson(json))
                .toList();

        setState(() {
          _projects.clear();
          _projects.addAll(projects);
          _isLoading = false;
          _hasMoreData = projects.length >= 10; // Assuming 10 items per page
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _error = 'Failed to load projects: $e';
        });
      }
    }
  }

  Future<void> _loadMoreProjects() async {
    if (_isLoading || !_hasMoreData) return;

    setState(() {
      _isLoading = true;
      _page++;
    });

    try {
      // In a real implementation, you'd pass the page parameter to your API
      final data = await ProjectsService.getProjectsByLocation(
        widget.location ?? 'New Delhi',
        page: _page,
      );

      if (mounted) {
        final List<Project> newProjects =
            (data['projects'] as List)
                .map((json) => Project.fromJson(json))
                .toList();

        setState(() {
          _projects.addAll(newProjects);
          _isLoading = false;
          _hasMoreData = newProjects.length > 0;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _page--; // Revert page increment since it failed
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Projects in ${widget.location ?? 'New Delhi'}'),
        elevation: 0,
      ),
      body:
          _error != null
              ? _buildErrorView()
              : _projects.isEmpty && !_isLoading
              ? _buildEmptyView()
              : _buildProjectsList(),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 60, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            'Failed to load projects',
            style: TextStyle(fontSize: 18, color: Colors.grey[800]),
          ),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: _loadProjects, child: const Text('Retry')),
        ],
      ),
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.home_work_outlined, size: 60, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'No projects found in ${widget.location ?? 'this location'}',
            style: TextStyle(fontSize: 18, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsList() {
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount:
          _projects.length + (_isLoading && _projects.isNotEmpty ? 1 : 0),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        if (index == _projects.length) {
          return const Center(child: CircularProgressIndicator());
        }

        final project = _projects[index];
        return _buildProjectCard(project);
      },
    );
  }

  Widget _buildProjectCard(Project project) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: CachedNetworkImage(
              imageUrl: project.image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder:
                  (context, url) => Container(
                    color: Colors.grey[200],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              errorWidget:
                  (context, url, error) => Container(
                    color: Colors.grey[300],
                    height: 180,
                    child: const Icon(
                      Icons.error,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
            ),
          ),

          // Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        project.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      project.price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  project.location,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                if (project.propertyType != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    project.propertyType!,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
