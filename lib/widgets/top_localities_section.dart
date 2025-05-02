import 'package:flutter/material.dart';
import 'package:ghar_chaiyo/models/locality_model.dart';
import 'package:ghar_chaiyo/services/localities_service.dart';
import 'package:ghar_chaiyo/screens/locality/locality_properties_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/theme.dart';

class TopLocalitiesSection extends StatefulWidget {
  const TopLocalitiesSection({Key? key}) : super(key: key);

  @override
  State<TopLocalitiesSection> createState() => _TopLocalitiesSectionState();
}

class _TopLocalitiesSectionState extends State<TopLocalitiesSection> {
  final List<Locality> _localities = [];
  final List<Property> _properties = [];
  String? _selectedLocality;
  bool _isLoading = true;
  bool _isLoadingProperties = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchLocalities();
  }

  Future<void> _fetchLocalities() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final localities = await LocalitiesService.getTopLocalities();

      if (mounted) {
        setState(() {
          _localities.clear();
          _localities.addAll(localities);
          _isLoading = false;

          // Select first locality by default if available
          if (_localities.isNotEmpty && _selectedLocality == null) {
            _selectedLocality = _localities.first.name;
            _fetchPropertiesForLocality(_selectedLocality!);
          }
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _error = 'Failed to load localities: $e';
        });
      }
    }
  }

  Future<void> _fetchPropertiesForLocality(String locality) async {
    setState(() {
      _isLoadingProperties = true;
      _properties.clear();
    });

    try {
      final properties = await LocalitiesService.getPropertiesByLocality(
        locality,
      );

      if (mounted) {
        setState(() {
          _properties.clear();
          _properties.addAll(properties);
          _isLoadingProperties = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingProperties = false;
          _error = 'Failed to load properties: $e';
        });
      }
    }
  }

  void _onLocalitySelected(String locality) {
    if (_selectedLocality != locality) {
      setState(() {
        _selectedLocality = locality;
      });
      _fetchPropertiesForLocality(locality);
    }
  }

  void _viewAllProperties() {
    if (_selectedLocality != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  LocalityPropertiesScreen(locality: _selectedLocality!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Localities heading with aqua underline
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Top Localities',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 40,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.tealAccent.shade400,
                  borderRadius: BorderRadius.circular(1.5),
                ),
              ),
            ],
          ),
        ),

        // Localities tabs
        _buildLocalitiesList(),

        // Properties in selected locality
        _buildPropertiesList(),

        // Bottom separator
        const Divider(height: 16, thickness: 8, color: Color(0xFFF5F5F5)),
      ],
    );
  }

  Widget _buildLocalitiesList() {
    if (_isLoading) {
      return const SizedBox(
        height: 45,
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    if (_localities.isEmpty) {
      return const SizedBox(
        height: 45,
        child: Center(
          child: Text(
            'No localities available',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    // Scrollable locality tabs
    return Container(
      height: 45,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: _localities.length,
        itemBuilder: (context, index) {
          final locality = _localities[index];
          final isSelected = _selectedLocality == locality.name;

          return InkWell(
            onTap: () => _onLocalitySelected(locality.name),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    locality.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSelected ? Colors.black87 : Colors.black54,
                    ),
                  ),
                  const Spacer(),
                  if (isSelected)
                    Container(
                      height: 3,
                      width: locality.name.length * 7.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(1.5),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPropertiesList() {
    if (_selectedLocality == null) {
      return const SizedBox.shrink();
    }

    if (_isLoadingProperties) {
      return const SizedBox(
        height: 220,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_properties.isEmpty) {
      return Container(
        height: 100,
        alignment: Alignment.center,
        child: Text(
          'No properties found in $_selectedLocality',
          style: const TextStyle(color: Colors.grey),
        ),
      );
    }

    return Column(
      children: [
        // Property cards in horizontal scrollable list
        SizedBox(
          height: 320, // Reduced from 370 to 320
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: _properties.length,
            itemBuilder:
                (context, index) => SizedBox(
                  width:
                      MediaQuery.of(context).size.width *
                      0.65, // Reduced from 0.7 to 0.65
                  child: _buildPropertyCard(_properties[index]),
                ),
          ),
        ),

        // "See all" link with arrow
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: _viewAllProperties,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'See all Properties in $_selectedLocality',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward, size: 16, color: Colors.red),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyCard(Property property) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with photo count indicator
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl: property.imageUrl,
                  height: 180, // Slightly smaller image
                  width: double.infinity,
                  fit: BoxFit.cover,
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
              // Photo count indicator - Using actual image count
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.photo, color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        // Just use 1 if imageUrl exists, otherwise 0
                        '${property.imageUrl != null ? 1 : 0}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // More compact property details
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title (2 BHK Flat)
                Text(
                  property.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Price
                Text(
                  property.price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Only the locality (not full location)
                Text(
                  property.area,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                // Status (more compact)
                Text(
                  property.status,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
