import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Projectsinlocation extends StatefulWidget {
  const Projectsinlocation({super.key});

  @override
  State<Projectsinlocation> createState() => _ProjectsinlocationState();
}

class _ProjectsinlocationState extends State<Projectsinlocation>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  final List<Map<String, dynamic>> _projects = [];
  bool _isLoading = true;

  @override
  bool get wantKeepAlive => true; // Keep state when scrolling

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
    _fetchProjects();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _fetchProjects() async {
    // In real app, fetch from API
    await Future.delayed(const Duration(milliseconds: 300));

    if (mounted) {
      setState(() {
        _projects.addAll([
          {
            'id': 1,
            'name': 'Property Gokul Dham',
            'price': '₹ 38.0 Lac',
            'priceSubtext': 'onwards',
            'type': '2, 3, 4 BHK Multistorey Apartment',
            'location': 'Sector 25 Rohini, New Delhi',
            'image': 'https://via.placeholder.com/300x200',
          },
          {
            'id': 2,
            'name': 'Munish Home',
            'price': '₹ 42.5 Lac',
            'priceSubtext': 'onwards',
            'type': '3 BHK Apartment',
            'location': 'Dwarka Metro, New Delhi',
            'image': 'https://via.placeholder.com/300x200',
          },
        ]);
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading with underline
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Projects In New Delhi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),

        // Tab bar
        TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade700,
          indicator: BoxDecoration(
            color: Colors.red.shade700,
            borderRadius: BorderRadius.circular(0),
          ),
          tabs: const [Tab(text: 'Newly Launched')],
        ),

        // Divider
        Divider(height: 1, thickness: 1, color: Colors.grey.shade300),

        // Project cards
        _isLoading
            ? const Center(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: CircularProgressIndicator(),
              ),
            )
            : _buildProjectCards(),
      ],
    );
  }

  Widget _buildProjectCards() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _projects.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final project = _projects[index];
        return _buildProjectCard(project);
      },
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    return RepaintBoundary(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl: project['image'],
                  fit: BoxFit.cover,
                  memCacheWidth: 600, // 2x for high DPI
                  placeholder:
                      (context, url) => Container(
                        color: Colors.grey.shade200,
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                  errorWidget:
                      (context, url, error) => Container(
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.error, color: Colors.white),
                      ),
                ),
              ),
            ),

            // Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          project['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow:
                              TextOverflow
                                  .ellipsis, // Add this to prevent overflow
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            project['price'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            project['priceSubtext'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Type
                  Text(
                    project['type'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Location
                  Text(
                    project['location'],
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
