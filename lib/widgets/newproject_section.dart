import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../services/projects_service.dart';
import '../models/project_model.dart';
import '../screens/projects/all_projects_screen.dart';
import 'dart:async';
import 'dart:math' as math;

class NewProjectsSection extends StatefulWidget {
  final String? location;

  const NewProjectsSection({super.key, this.location});

  @override
  State<NewProjectsSection> createState() => _NewProjectsSectionState();
}

class _NewProjectsSectionState extends State<NewProjectsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // State variables for API data
  final List<Project> _projects = [];
  int _totalProjects = 0;
  bool _isLoading = true;
  String? _error;
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.65, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.25),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.65, curve: Curves.easeOutCubic),
      ),
    );

    _fetchProjects();

    // Set up refresh timer - fetch data every 5 minutes
    _refreshTimer = Timer.periodic(
      const Duration(minutes: 5),
      (_) => _fetchProjects(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _fetchProjects() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // In a real app, fetch projects from the API using ProjectsService
      final data = await ProjectsService.getNewProjects(
        location: widget.location,
        limit: 3, // Fetch only first 3 for preview
      );

      if (!mounted) return;

      // Parse the response into Project objects
      final List<Project> projects =
          (data['projects'] as List)
              .map((json) => Project.fromJson(json))
              .toList();

      // Get total count for "View All" button
      final totalCount = data['totalCount'] as int? ?? projects.length;

      setState(() {
        _projects.clear();
        _projects.addAll(projects);
        _totalProjects = totalCount;
        _isLoading = false;
      });

      // Start animation after data is loaded
      _animationController.forward();
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
        _error = 'Failed to load projects: $e';
        _projects.clear();
      });

      // Add fallback data for development only
      if (const bool.fromEnvironment('dart.vm.product') == false) {
        _addFallbackData();
      }
    }
  }

  // Add fallback data for development
  void _addFallbackData() {
    setState(() {
      _projects.addAll([
        Project(
          id: 1,
          name: 'DLF One Midtown',
          location: 'New Delhi',
          price: '₹ 3.75 Cr - 10.50 Cr',
          image: 'https://via.placeholder.com/150',
        ),
        Project(
          id: 2,
          name: 'Unity the Amaryllis',
          location: 'New Delhi',
          price: '₹ 2.25 Cr - 12.70 Cr',
          image: 'https://via.placeholder.com/150',
        ),
        Project(
          id: 3,
          name: 'Property Gokul Dham',
          location: 'New Delhi',
          price: '₹ 38.0 Lac - 1.15 Cr',
          image: 'https://via.placeholder.com/150',
        ),
      ]);
      _totalProjects = 6;
      _isLoading = false;
    });

    // Start animation with fallback data
    _animationController.forward();
  }

  void _onViewAllPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllProjectsScreen(location: widget.location),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Magic Homes badge and heading
                  _buildHeader(),

                  // Project list with circular images
                  _buildContent(),

                  // View All link with dynamic count
                  _buildViewAllLink(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ghar Chiyo badge - centered
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.pink.shade100),
              ),
              child: Text(
                'Ghar Chiyo?',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.pink.shade400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Project count and location with overflow protection
          Text(
            _totalProjects > 0
                ? '$_totalProjects New Projects in ${widget.location ?? 'New Delhi'}'
                : 'New Projects',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'As per your search preferences',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_error != null) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.error_outline, color: Colors.red[300], size: 40),
              const SizedBox(height: 8),
              Text(
                'Unable to load projects',
                style: TextStyle(color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: _fetchProjects,
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }

    if (_projects.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text(
            'No projects available',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      );
    }

    return _buildProjectsList();
  }

  Widget _buildProjectsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate adaptive height based on available vertical space
          final availableHeight =
              constraints.maxHeight > 0 ? constraints.maxHeight : 150;
          final cardHeight = math.min(150, availableHeight).toDouble();

          return SizedBox(
            height: cardHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _projects.length,
              itemBuilder: (context, index) {
                final project = _projects[index];
                return _buildProjectCard(project, cardHeight);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildProjectCard(Project project, double maxHeight) {
    // Get screen dimensions to calculate adaptive sizing
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final textScaleFactor = mediaQuery.textScaleFactor;

    // More responsive sizing
    final isSmallScreen = screenWidth < 360;
    final isTinyScreen = screenWidth < 320;
    final isShortScreen = screenHeight < 600;

    // Adaptive card sizing
    final cardWidth = isTinyScreen ? 105.0 : (isSmallScreen ? 125.0 : 140.0);

    // Calculate image size based on both width and height constraints
    final maxImageSize =
        isShortScreen
            ? 65.0
            : (isTinyScreen ? 68.0 : (isSmallScreen ? 78.0 : 85.0));
    final imageSize =
        math
            .min(maxImageSize, maxHeight * 0.55)
            .toDouble(); // Image takes max 55% of card height

    // Adjust text sizing
    final nameFontSize =
        (isTinyScreen ? 11.0 : (isSmallScreen ? 13.0 : 14.0)) / textScaleFactor;
    final detailsFontSize =
        (isTinyScreen ? 9.0 : (isSmallScreen ? 10.0 : 12.0)) / textScaleFactor;

    // Calculate available space for text (need to account for spacing too)
    final textAreaHeight = maxHeight - imageSize - 16; // 16px for spacing
    final individualTextHeight =
        textAreaHeight / 3; // Divide by 3 (name, location, price)

    return RepaintBoundary(
      child: Container(
        width: cardWidth,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use minimum space needed
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular image with responsive sizing
            SizedBox(
              height: imageSize,
              width: imageSize,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red.shade300, width: 2),
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: project.image,
                    fit: BoxFit.cover,
                    memCacheWidth: imageSize.toInt() * 2,
                    placeholder:
                        (context, url) => Container(
                          color: Colors.grey.shade200,
                          child: const Icon(
                            Icons.home_outlined,
                            color: Colors.white70,
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => Container(
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.error, color: Colors.white),
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4), // Reduced spacing
            // Project name
            SizedBox(
              height: individualTextHeight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: cardWidth - 6),
                  child: Text(
                    project.name,
                    style: TextStyle(
                      fontSize: nameFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            // Location
            SizedBox(
              height: individualTextHeight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: cardWidth - 6),
                  child: Text(
                    project.location,
                    style: TextStyle(
                      fontSize: detailsFontSize,
                      color: Colors.grey.shade600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            // Price
            SizedBox(
              height: individualTextHeight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: cardWidth - 6),
                  child: Text(
                    project.price,
                    style: TextStyle(
                      fontSize: detailsFontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade800,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewAllLink() {
    return InkWell(
      onTap: _onViewAllPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View All ($_totalProjects)',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.arrow_forward_ios, size: 12, color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
