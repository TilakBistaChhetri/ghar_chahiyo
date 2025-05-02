import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/locality_model.dart';

class LocalitiesService {
  static String get baseUrl {
    return const bool.fromEnvironment('dart.vm.product')
        ? 'https://your-production-api.com'
        : 'http://10.0.2.2:3000';
  }

  static final http.Client _client = http.Client();

  // Extract locality from location string (e.g., "Kathmandu, Basantapur" -> "Basantapur")
  static String extractLocalityFromLocation(String fullLocation) {
    if (fullLocation.contains(',')) {
      final parts = fullLocation.split(',');
      return parts.last.trim();
    }
    return fullLocation.trim();
  }

  // Get top localities from property data
  static Future<List<Locality>> getTopLocalities() async {
    try {
      // Try to get data from projects and projects_new endpoints
      final projects = await _fetchProjects();

      // Map to store unique localities with counts
      final Map<String, int> localityCounts = {};

      // Process all projects to extract localities
      for (var project in projects) {
        final location = project['location'];
        if (location != null && location.isNotEmpty) {
          final locality = extractLocalityFromLocation(location);
          localityCounts[locality] = (localityCounts[locality] ?? 0) + 1;
        }
      }

      // Create locality objects sorted by count
      final localities =
          localityCounts.entries
              .map(
                (entry) => Locality(
                  id: entry.key,
                  name: entry.key,
                  propertyCount: entry.value,
                ),
              )
              .toList();

      // Sort by property count
      localities.sort((a, b) => b.propertyCount.compareTo(a.propertyCount));

      return localities;
    } catch (e) {
      if (kDebugMode) {
        print('❌ Failed to extract localities: $e');
      }

      // Return fallback data for development
      if (const bool.fromEnvironment('dart.vm.product') == false) {
        return [
          Locality(id: '1', name: 'Dwarka', propertyCount: 42),
          Locality(id: '2', name: 'Laxmi Nagar', propertyCount: 35),
          Locality(id: '3', name: 'Uttam Nagar', propertyCount: 28),
          Locality(id: '4', name: 'Saket', propertyCount: 23),
          Locality(id: '5', name: 'Basantapur', propertyCount: 18),
          Locality(id: '6', name: 'Jaipur', propertyCount: 15),
        ];
      }

      throw Exception('Failed to load localities');
    }
  }

  // Fetch all projects from API
  static Future<List<dynamic>> _fetchProjects() async {
    List<dynamic> allProjects = [];

    // Try to get projects from projects_new endpoint
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/projects_new'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['projects'] is List) {
          allProjects.addAll(data['projects']);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch projects_new: $e');
      }
    }

    // Try to get projects from projects endpoint
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/projects'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['projects'] is List) {
          allProjects.addAll(data['projects']);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch projects: $e');
      }
    }

    return allProjects;
  }

  // Get properties by locality
  static Future<List<Property>> getPropertiesByLocality(String locality) async {
    try {
      // Fetch all properties
      final projects = await _fetchProjects();

      // Filter properties by locality
      final filteredProjects =
          projects.where((project) {
            final location = project['location'] as String?;
            if (location == null || location.isEmpty) return false;

            return extractLocalityFromLocation(location) == locality ||
                location.contains(locality);
          }).toList();

      // Take only the top 2 properties
      final limitedProjects = filteredProjects.take(2).toList();

      // Convert to Property objects
      return limitedProjects.map((project) {
        final propertyType = project['propertyType'] as String? ?? '';
        final title =
            propertyType.contains('BHK')
                ? propertyType.substring(0, propertyType.indexOf('BHK') + 3)
                : (project['name'] as String? ?? 'Property');

        // Extract just the area/locality
        final area = project['area'] as String? ?? '';

        // Get image count if available
        final imageCount =
            project['images'] != null
                ? (project['images'] as List).length
                : project['imageCount'] as int? ?? 7;

        return Property(
          id: project['id'].toString(),
          title: title,
          price: project['price'] as String? ?? '',
          imageUrl: project['image'] as String? ?? '',
          location: project['location'] as String? ?? '',
          area: area, // Just use the area (locality)
          status: project['possession'] as String? ?? 'Ready to Move',
          size: project['size'] as String? ?? '',
          imageCount: imageCount,
        );
      }).toList();
    } catch (e) {
      if (kDebugMode) {
        print('❌ Failed to get properties by locality: $e');
      }

      // Return fallback data for development
      if (const bool.fromEnvironment('dart.vm.product') == false &&
          locality == 'Dwarka') {
        return [
          Property(
            id: '1',
            title: '2 BHK Flat',
            price: '₹ 1.20 Cr',
            imageUrl: 'https://via.placeholder.com/300x200',
            location: 'Dwarka, New Delhi',
            area: 'Sector 14',
            status: 'Ready to Move',
          ),
          Property(
            id: '2',
            title: '2 BHK Flat',
            price: '₹ 55 Lac | 730 sqft',
            imageUrl: 'https://via.placeholder.com/300x200',
            location: 'Dwarka, New Delhi',
            area: 'Sector 28',
            status: 'Ready to Move',
          ),
        ];
      }

      return [];
    }
  }
}
