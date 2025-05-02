import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../services/search_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchResultsSection extends StatefulWidget {
  const SearchResultsSection({super.key});

  @override
  State<SearchResultsSection> createState() => _SearchResultsSectionState();
}

class _SearchResultsSectionState extends State<SearchResultsSection>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  bool _isLoading = true;
  List<Map<String, dynamic>> _recentSearches = [];
  List<Map<String, dynamic>> _recommendedSearches = [];

  // Keep alive when scrolling off screen
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _fetchSearchData();
  }

  // Real API call using SearchService
  Future<void> _fetchSearchData() async {
    setState(() => _isLoading = true);

    try {
      final data = await SearchService.getSearchResults();

      if (mounted) {
        setState(() {
          _recentSearches = List<Map<String, dynamic>>.from(
            data['recentSearches'],
          );
          _recommendedSearches = List<Map<String, dynamic>>.from(
            data['recommendedSearches'],
          );
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
      debugPrint('Error fetching search data: $e');
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Exact spacing as in screenshot
        SizedBox(height: 10),

        // "Let's continue your search" heading with exact spacing and style
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 12),
          child: Text(
            'Let\'s continue your search',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),

        // Tab bar with exact styling from screenshot
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ), // Align with "Let's continue" heading
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            padding: EdgeInsets.zero, // Remove default padding
            indicatorPadding: EdgeInsets.zero, // Remove indicator padding
            labelPadding: const EdgeInsets.only(
              left: 0,
              right: 24,
            ), // Control spacing between tabs
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.grey.shade700,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            indicatorColor: AppColors.primary,
            indicatorWeight: 3,
            tabs: const [
              Tab(text: 'Recent Search'),
              Tab(text: 'Requested'),
              Tab(text: 'Shortlisted'),
              Tab(text: 'Contacted'),
            ],
          ),
        ),

        // Optimized tab content with exact height to match screenshot
        SizedBox(
          height: 160, // Exact height as in screenshot
          child:
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : TabBarView(
                    controller: _tabController,
                    children: [
                      _buildSearchCards(),
                      _buildTabContent('requested'),
                      _buildTabContent('shortlisted'),
                      _buildTabContent('contacted'),
                    ],
                  ),
        ),
      ],
    );
  }

  Widget _buildSearchCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(
        left: 16,
        top: 16,
        bottom: 8,
      ), // Keep the left gap as requested
      child: Row(
        children: [
          // Map through real data for recent searches
          if (_recentSearches.isNotEmpty)
            ..._recentSearches.map(
              (search) => _buildSearchCard(
                search['type'],
                search['propertyType'],
                search['location'],
              ),
            ),

          // Map through real data for recommended searches
          if (_recommendedSearches.isNotEmpty)
            ..._recommendedSearches.map(
              (search) => _buildRecommendedCard(
                search['propertyType'],
                search['distance'],
                search['location'],
              ),
            ),

          // Start new search card with exact styling from screenshot
          _buildStartNewSearchCard(),
        ],
      ),
    );
  }

  Widget _buildSearchCard(String type, String propertyType, String location) {
    // Adding const where possible for widget optimization
    return Container(
      width: 155, // Exact width from screenshot
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Type label at top with exact styling
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 10, right: 12),
            child: Text(
              type,
              style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
            ),
          ),

          // Property details with exact styling and spacing
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    propertyType,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(location, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ),

          // View All link at bottom with exact styling
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'View All',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedCard(
    String propertyType,
    String distance,
    String location,
  ) {
    // Using const for optimization
    return Container(
      width: 155, // Exact width from screenshot
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAE5), // Exact color from screenshot
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recommended label at top with exact styling
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: const BoxDecoration(
              color: Color(0xFFFFC107), // Exact yellow from screenshot
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: const Text(
              'RECOMMENDED',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Property details with exact styling and spacing
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    propertyType,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    distance,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  Text(location, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ),

          // View All link at bottom with exact styling
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'View All',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartNewSearchCard() {
    return Container(
      width: 155, // Exact width from screenshot
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Plus icon with exact size and styling
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.black87, size: 28),
          ),
          const SizedBox(height: 8),
          const Text(
            'Start New',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const Text(
            'Search',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String tabType) {
    // Check if specific data is available for this tab
    final tabData = _getTabData(tabType);

    if (tabData.isEmpty) {
      // No data available for this tab
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, color: Colors.grey.shade400, size: 32),
            const SizedBox(height: 8),
            Text(
              'No ${tabType.capitalize()} properties found',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    // Display tab data in horizontal scrolling layout
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
      child: Row(
        children:
            tabData.map((item) {
              // Use appropriate card builder based on tab type
              switch (tabType) {
                case 'requested':
                  return _buildRequestedCard(item);
                case 'shortlisted':
                  return _buildShortlistedCard(item);
                case 'contacted':
                  return _buildContactedCard(item);
                default:
                  return _buildSearchCard(
                    item['type'] ?? '',
                    item['propertyType'] ?? '',
                    item['location'] ?? '',
                  );
              }
            }).toList(),
      ),
    );
  }

  List<Map<String, dynamic>> _getTabData(String tabType) {
    // This would connect to your backend data
    switch (tabType) {
      case 'requested':
        // Return requested items from backend or empty list
        return []; // Replace with real data when available
      case 'shortlisted':
        // Return shortlisted items from backend or empty list
        return []; // Replace with real data when available
      case 'contacted':
        // Return contacted items from backend or empty list
        return []; // Replace with real data when available
      default:
        return [];
    }
  }

  Widget _buildRequestedCard(Map<String, dynamic> item) {
    // Similar to _buildSearchCard but with requested styling
    return Container(
      width: 155,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      // Customize for requested properties...
      child: Column(
        // Your card content
      ),
    );
  }

  Widget _buildShortlistedCard(Map<String, dynamic> item) {
    // Similar to _buildSearchCard but with shortlisted styling
    return Container(
      width: 155,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      // Customize for shortlisted properties...
      child: Column(
        // Your card content
      ),
    );
  }

  Widget _buildContactedCard(Map<String, dynamic> item) {
    // Similar to _buildSearchCard but with contacted styling
    return Container(
      width: 155,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      // Customize for contacted properties...
      child: Column(
        // Your card content
      ),
    );
  }
}

// Add this extension somewhere in your file
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
