import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import '../theme/theme.dart';
import '../screens/filters/filter_screen.dart';
import '../screens/properties/nearby_properties_screen.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Haptic feedback for better user experience
    void _provideHapticFeedback() {
      HapticFeedback.lightImpact();
    }

    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          // Property type selector
          InkWell(
            onTap: () {
              _provideHapticFeedback();
              _openFiltersScreen(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Row(
                children: [
                  const Text(
                    'Buy',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),

          // Divider
          SizedBox(
            height: 24,
            child: VerticalDivider(
              color: Colors.grey.shade300,
              width: 1,
              thickness: 1,
            ),
          ),

          // Search field
          Expanded(
            child: InkWell(
              onTap: () {
                _provideHapticFeedback();
                _openFiltersScreen(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'Search Project',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const Spacer(),
                    // Near Me button
                    GestureDetector(
                      onTap: () {
                        _provideHapticFeedback();
                        _openNearbyProperties(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Near me',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.my_location,
                              size: 18,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openFiltersScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FilterScreen()),
    );

    // If filters were applied, navigate to filtered results
    if (result != null && result is Map<String, dynamic>) {
      Navigator.pushNamed(context, '/search-results', arguments: result);
    }
  }

  void _openNearbyProperties(BuildContext context) async {
    try {
      // First, check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Location services are disabled. Please enable location services in settings.',
            ),
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      // Then check permission status
      LocationPermission permission = await Geolocator.checkPermission();

      // If permission is denied, request it
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        // If still denied after request, show message and return
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Location permission is required to show nearby properties.',
              ),
              duration: Duration(seconds: 3),
            ),
          );
          return;
        }
      }

      // If permission is permanently denied, inform the user they need to enable it in settings
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Location permission is permanently denied. Please enable it in app settings.',
            ),
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Get current position
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );

      // Close loading indicator
      if (context.mounted) {
        Navigator.pop(context);
      }

      // Navigate to nearby properties screen
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => NearbyPropertiesScreen(
                  latitude: position.latitude,
                  longitude: position.longitude,
                ),
          ),
        );
      }
    } catch (e) {
      // Close any open dialog
      if (Navigator.of(context).canPop()) {
        Navigator.pop(context);
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error accessing location: $e')));
    }
  }
}
