import 'package:flutter/material.dart';
import '../../models/property.dart';
import '../../services/property_service.dart';
import '../../theme/theme.dart';

class SearchResultsScreen extends StatefulWidget {
  final Map<String, dynamic> filters;

  const SearchResultsScreen({Key? key, required this.filters})
    : super(key: key);

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late List<PropertyListing> _properties = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    debugPrint('SearchResultsScreen - Received filters: ${widget.filters}');
    _fetchSearchResults();
  }

  Future<void> _fetchSearchResults() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      debugPrint('Fetching properties with filters...');

      // Call the service to search properties
      final properties = await PropertyService.searchProperties(widget.filters);

      debugPrint('Received ${properties.length} properties');

      if (mounted) {
        setState(() {
          _properties = properties;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error fetching properties: $e');
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 360;

    // Generate title from filters
    String title = widget.filters['propertyCategory'] ?? 'Sale';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            Text(title),
            const SizedBox(width: 8),
            Text(
              '${_isLoading ? '...' : _properties.length} Properties',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child:
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _error != null
                ? _buildErrorWidget()
                : Column(
                  children: [
                    // Filter chips
                    _buildFilterChips(),

                    // Main content
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: _fetchSearchResults,
                        child:
                            _properties.isEmpty
                                ? ListView(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  children: [
                                    SizedBox(height: screenSize.height / 3),
                                    const Center(
                                      child: Text(
                                        'No properties found matching your criteria',
                                      ),
                                    ),
                                  ],
                                )
                                : ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: _properties.length,
                                  itemBuilder: (context, index) {
                                    final property = _properties[index];
                                    return _buildPropertyCard(
                                      property,
                                      isSmallScreen,
                                    );
                                  },
                                ),
                      ),
                    ),

                    // Bottom action buttons
                    _buildBottomActionButtons(isSmallScreen),
                  ],
                ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Property type chips
            if (widget.filters['propertyTypes'] != null)
              for (String type in widget.filters['propertyTypes'])
                _buildChip(type),

            // Bedroom chips
            if (widget.filters['bedrooms'] != null)
              for (String bedroom in widget.filters['bedrooms'])
                _buildChip(bedroom),

            // Budget chip
            if (widget.filters['minBudget'] != null &&
                widget.filters['maxBudget'] != null)
              _buildChip(
                '${widget.filters['minBudget']} - ${widget.filters['maxBudget']}',
              ),

            // Location chip
            if (widget.filters['locality'] != null)
              _buildChip(widget.filters['locality']),

            // Current location chip
            if (widget.filters['useCurrentLocation'] == true)
              _buildChip('Near Current Location'),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
      ),
    );
  }

  Widget _buildPropertyCard(PropertyListing property, bool isSmallScreen) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property image and details
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property image with better error handling
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    property.imageUrl,
                    width: isSmallScreen ? 100 : 120,
                    height: isSmallScreen ? 100 : 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      debugPrint(
                        'Image error: $error for ${property.imageUrl}',
                      );
                      return Container(
                        width: isSmallScreen ? 100 : 120,
                        height: isSmallScreen ? 100 : 120,
                        color: Colors.grey.shade200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              size: 36,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'No image',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: isSmallScreen ? 100 : 120,
                        height: isSmallScreen ? 100 : 120,
                        color: Colors.grey.shade100,
                        child: Center(
                          child: CircularProgressIndicator(
                            value:
                                loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Rest of your property card implementation
                // ...
              ],
            ),
          ),
          // Rest of your card implementation
          // ...
        ],
      ),
    );
  }

  Widget _buildBottomActionButtons(bool isSmallScreen) {
    // Same implementation as in NearbyPropertiesScreen
    return Container(
      // Your bottom actions implementation
    );
  }

  Widget _buildErrorWidget() {
    return RefreshIndicator(
      onRefresh: _fetchSearchResults,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 3),
          Center(
            child: Column(
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text(
                  'Error: $_error',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Pull down to refresh',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
