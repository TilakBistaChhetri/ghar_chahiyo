import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/theme/theme.dart';
import '../../models/property.dart';
import '../../services/property_service.dart';

class NearbyPropertiesScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  const NearbyPropertiesScreen({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  State<NearbyPropertiesScreen> createState() => _NearbyPropertiesScreenState();
}

class _NearbyPropertiesScreenState extends State<NearbyPropertiesScreen> {
  late List<PropertyListing> _properties = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchNearbyProperties();
  }

  Future<void> _fetchNearbyProperties() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Call the service to get nearby properties
      final properties = await PropertyService.getNearbyProperties(
        widget.latitude,
        widget.longitude,
      );

      if (mounted) {
        setState(() {
          _properties = properties;
          _isLoading = false;
        });
      }
    } catch (e) {
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
    // Get screen size for responsive layout
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 360;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            const Text('Sale'),
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
                    // Filter options bar
                    _buildFilterOptionsBar(isSmallScreen),

                    // Main content
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: _fetchNearbyProperties,
                        child:
                            _properties.isEmpty
                                ? ListView(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  children: [
                                    SizedBox(height: screenSize.height / 3),
                                    const Center(
                                      child: Text('No properties found nearby'),
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

  Widget _buildErrorWidget() {
    return RefreshIndicator(
      onRefresh: _fetchNearbyProperties,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 3),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 60),
              const SizedBox(height: 16),
              const Text(
                'Error loading properties',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(_error!, textAlign: TextAlign.center),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _fetchNearbyProperties,
                child: const Text('Try Again'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOptionsBar(bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: isSmallScreen ? 4 : 8,
      ),
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
      child: Row(
        children: [
          // Sort & Filter button
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.filter_list,
                    size: isSmallScreen ? 16 : 18,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(width: isSmallScreen ? 2 : 4),
                  Text(
                    'Sort & Filter',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 14,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: isSmallScreen ? 4 : 8),

          // Near Me button
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.near_me,
                    size: isSmallScreen ? 16 : 18,
                    color: Colors.red.shade700,
                  ),
                  SizedBox(width: isSmallScreen ? 2 : 4),
                  Text(
                    'Near me',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 14,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: isSmallScreen ? 4 : 8),

          // New Projects button
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.stars,
                    size: isSmallScreen ? 16 : 18,
                    color: Colors.amber.shade700,
                  ),
                  SizedBox(width: isSmallScreen ? 2 : 4),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'New Projects',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 14,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
                // Property image with flexible width
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    property.imageUrl,
                    width: isSmallScreen ? 100 : 120,
                    height: isSmallScreen ? 100 : 120,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (_, __, ___) => Container(
                          width: isSmallScreen ? 100 : 120,
                          height: isSmallScreen ? 100 : 120,
                          color: Colors.grey.shade200,
                          child: const Icon(
                            Icons.home,
                            size: 48,
                            color: Colors.grey,
                          ),
                        ),
                  ),
                ),
                SizedBox(width: isSmallScreen ? 8 : 12),

                // Property details with expanded width
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Price
                      Text(
                        property.price,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 16 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Property type and size
                      Text(
                        '${property.bedrooms} ${property.propertyType} ${property.size}',
                        style: TextStyle(fontSize: isSmallScreen ? 14 : 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),

                      // Location
                      Text(
                        '${property.locality}, ${property.city}',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 13 : 14,
                          color: Colors.grey.shade700,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4),

                      // Ready to move status
                      Text(
                        property.status,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 13 : 14,
                          color: Colors.grey.shade700,
                        ),
                      ),

                      // Posted date
                      Text(
                        'Posted: ${property.postedDate}',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 11 : 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                // More options button
                SizedBox(
                  width: isSmallScreen ? 32 : 40,
                  child: IconButton(
                    icon: const Icon(Icons.more_vert),
                    iconSize: isSmallScreen ? 18 : 24,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          // Property tags if any
          if (property.tags.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: Wrap(
                spacing: 8,
                children: [
                  for (final tag in property.tags.take(2))
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: isSmallScreen ? 14 : 16,
                          color: Colors.green.shade700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          tag,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 11 : 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),

          // Contact options
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 4 : 8,
              vertical: isSmallScreen ? 8 : 12,
            ),
            child: Row(
              children: [
                // WhatsApp button
                SizedBox(
                  width: isSmallScreen ? 36 : 40,
                  child: IconButton(
                    icon: Image.asset('assets/logo.png', width: 24, height: 24),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                  ),
                ),

                // Get Phone number button
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade300),
                      padding: EdgeInsets.symmetric(
                        vertical: isSmallScreen ? 4 : 8,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.visibility, size: isSmallScreen ? 16 : 18),
                        SizedBox(width: isSmallScreen ? 4 : 8),
                        Text(
                          'Get Phone no.',
                          style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: isSmallScreen ? 4 : 8),

                // Call Agent button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: isSmallScreen ? 4 : 8,
                      ),
                    ),
                    child: Text(
                      'Call Agent',
                      style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }

  Widget _buildBottomActionButtons(bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 12 : 16,
        horizontal: isSmallScreen ? 8 : 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          // Request Photo button
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade300),
                padding: EdgeInsets.symmetric(vertical: isSmallScreen ? 8 : 12),
              ),
              child: Text(
                'Request Photo',
                style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
              ),
            ),
          ),
          SizedBox(width: isSmallScreen ? 8 : 12),

          // Prime Filter button
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: isSmallScreen ? 8 : 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Prime Filter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isSmallScreen ? 12 : 14,
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(width: isSmallScreen ? 8 : 12),

          // Save Search button
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: isSmallScreen ? 8 : 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Save Search',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isSmallScreen ? 12 : 14,
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
