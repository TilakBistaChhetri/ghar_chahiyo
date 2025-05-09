import 'package:flutter/material.dart';

class AmenitiesNearby extends StatelessWidget {
  const AmenitiesNearby({super.key});

  @override
  Widget build(BuildContext context) {
    final amenities = [
      {'icon': Icons.fitness_center, 'label': 'Gym & Fit'},
      {'icon': Icons.wifi, 'label': 'Wi-fi'},
      {'icon': Icons.restaurant, 'label': 'Restaurant'},
      {'icon': Icons.pets, 'label': 'Pet Center'},
      {'icon': Icons.sports_soccer, 'label': 'Sports Cl..'},
      {'icon': Icons.local_laundry_service, 'label': 'Laundry'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Center(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: amenities.map((amenity) {
              return Container(
                width: 100,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      amenity['icon'] as IconData,
                      size: 30,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      amenity['label'] as String,
                      style: const TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}