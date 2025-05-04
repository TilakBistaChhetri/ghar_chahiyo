import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/property.dart';
import '../config/app_config.dart';

class PropertyService {
  // Use appropriate base URL for your environment
  static final String baseUrl =
      kDebugMode ? 'http://10.0.2.2:3000/api' : 'https://api.gharchaiyo.com';

  // Get properties near a location
  static Future<List<PropertyListing>> getNearbyProperties(
    double latitude,
    double longitude,
  ) async {
    try {
      // Log request for debugging
      debugPrint('Fetching nearby properties: lat=$latitude, lon=$longitude');

      final response = await http
          .get(
            Uri.parse(
              '$baseUrl/properties/nearby?lat=$latitude&lon=$longitude',
            ),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(
            const Duration(seconds: 15), // Add timeout
            onTimeout:
                () => throw Exception('Connection timeout. Please try again.'),
          );

      // Log response status for debugging
      debugPrint('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        debugPrint('Data received: ${data['properties']?.length} properties');

        if (data['properties'] is List) {
          return (data['properties'] as List)
              .map((item) => PropertyListing.fromJson(item))
              .toList();
        } else {
          throw Exception('Invalid data format received from server');
        }
      } else {
        debugPrint('Error response: ${response.body}');
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Exception in getNearbyProperties: $e');

      // In production, rethrow the error instead of using dummy data
      if (!kDebugMode) {
        throw Exception('Failed to load nearby properties: $e');
      }

      // Only use dummy data in debug mode with a warning
      debugPrint(
        'WARNING: Using dummy data for development. This should not happen in production.',
      );
      return _getDummyProperties();
    }
  }

  // Search properties with filters
  static Future<List<PropertyListing>> searchProperties(
    Map<String, dynamic> filters,
  ) async {
    try {
      // Debug logging
      debugPrint('Searching properties with filters: $filters');

      // Format filters for API if needed
      final apiFilters = _formatFiltersForApi(filters);

      // Make POST request with filters
      final response = await http
          .post(
            Uri.parse('$baseUrl/properties/search'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(apiFilters),
          )
          .timeout(const Duration(seconds: 10));

      debugPrint('Search API response code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        debugPrint(
          'Received ${data['properties']?.length ?? 0} properties from API',
        );

        if (data['properties'] is List) {
          return (data['properties'] as List)
              .map((item) => PropertyListing.fromJson(item))
              .toList();
        }
      }

      
      if (response.statusCode != 200) {
        debugPrint('API error: ${response.body}');
      }

      // During development, use dummy data if API fails
      if (kDebugMode) {
        debugPrint('Using dummy data for development');
        return _getDummySearchResults(filters);
      }

      throw Exception('Failed to search properties: ${response.statusCode}');
    } catch (e) {
      debugPrint('Exception searching properties: $e');

      // In development mode, return dummy data instead of crashing
      if (kDebugMode) {
        return _getDummySearchResults(filters);
      }

      rethrow;
    }
  }

  // Format filters for API compatibility
  static Map<String, dynamic> _formatFiltersForApi(
    Map<String, dynamic> filters,
  ) {
    // Create a new map to avoid modifying the original
    final apiFilters = Map<String, dynamic>.from(filters);

    // Handle budget formatting - convert from ₹ format to numeric values
    if (apiFilters['minBudget'] != null) {
      apiFilters['minBudget'] = _convertCurrencyToNumber(
        apiFilters['minBudget'],
      );
    }

    if (apiFilters['maxBudget'] != null) {
      apiFilters['maxBudget'] = _convertCurrencyToNumber(
        apiFilters['maxBudget'],
      );
    }

    return apiFilters;
  }

  // Helper to convert currency string like "₹ 10 Lac" to numeric value
  static int _convertCurrencyToNumber(String currencyString) {
    try {
      final withoutSymbol = currencyString.replaceFirst('₹', '').trim();

      if (withoutSymbol.contains('Lac')) {
        final value = double.parse(withoutSymbol.replaceAll('Lac', '').trim());
        return (value * 100000).round();
      } else if (withoutSymbol.contains('Cr')) {
        final value = double.parse(withoutSymbol.replaceAll('Cr', '').trim());
        return (value * 10000000).round();
      } else {
        return int.parse(withoutSymbol.replaceAll(',', ''));
      }
    } catch (e) {
      debugPrint('Error converting currency: $e');
      return 0;
    }
  }

  // Dummy data for development to ensure UI works while backend is being developed
  static List<PropertyListing> _getDummySearchResults(
    Map<String, dynamic> filters,
  ) {
    // Generate properties based on filters for realistic testing
    String propertyType =
        filters['propertyTypes']?.isNotEmpty == true
            ? filters['propertyTypes'][0]
            : 'Flat';

    String bedrooms =
        filters['bedrooms']?.isNotEmpty == true
            ? filters['bedrooms'][0]
            : '3 BHK';

    return [
      PropertyListing(
        id: '101',
        price: '₹ 1.45 Cr',
        bedrooms: bedrooms,
        propertyType: propertyType,
        size: '1200 sqft',
        locality: 'Indirapuram',
        city: 'Ghaziabad',
        imageUrl:
            'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg',
        status: 'Ready to Move',
        postedDate: 'Apr 22, \'23',
        tags: ['New Construction', 'Corner Property'],
      ),
      PropertyListing(
        id: '102',
        price: '₹ 2.75 Cr',
        bedrooms: bedrooms,
        propertyType: propertyType,
        size: '1850 sqft',
        locality: 'Sector 62',
        city: 'Noida',
        imageUrl:
            'https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg',
        status: 'Ready to Move',
        postedDate: 'Apr 20, \'23',
        tags: ['Vastu Compliant'],
      ),
      PropertyListing(
        id: '103',
        price: '₹ 3.25 Cr',
        bedrooms: bedrooms,
        propertyType: propertyType,
        size: '2100 sqft',
        locality: 'Vasant Kunj',
        city: 'New Delhi',
        imageUrl:
            'https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg',
        status: 'Under Construction',
        postedDate: 'Apr 18, \'23',
        tags: ['Park Facing', 'Corner Property'],
      ),
    ];
  }

  // Dummy data for development
  static List<PropertyListing> _getDummyProperties() {
    return [
      PropertyListing(
        id: '1',
        price: '₹ 1.30 Cr',
        bedrooms: '3 BHK',
        propertyType: 'Builder Floor',
        size: '1000 sqft',
        locality: 'Sector 22 Rohini',
        city: 'New Delhi',
        imageUrl:
            'https://images.unsplash.com/photo-1580216143879-3a7e4fd7a05c?q=80&w=1074&auto=format&fit=crop',
        status: 'Ready to Move',
        postedDate: 'Apr 21, \'25',
        tags: ['Newly Constructed Property'],
      ),
      PropertyListing(
        id: '2',
        price: '₹ 3.45 Cr',
        bedrooms: '3 BHK',
        propertyType: 'Flat',
        size: '1800 sqft',
        locality: 'Gold Croft Apartment, Sector 11 Dwarka',
        city: 'New Delhi',
        imageUrl:
            'https://images.unsplash.com/photo-1621866316521-a5a5382df1c7?q=80&w=1074&auto=format&fit=crop',
        status: 'Ready to Move',
        postedDate: 'Apr 21, \'25',
        tags: [],
      ),
      PropertyListing(
        id: '3',
        price: '₹ 2.49 Cr',
        bedrooms: '3 BHK',
        propertyType: 'Flat',
        size: '1600 sqft',
        locality: 'Adarsh Arya Apartment, Sector 6 Dwarka',
        city: 'New Delhi',
        imageUrl:
            'https://images.unsplash.com/photo-1560184897-67f4a3f9a7fa?q=80&w=1074&auto=format&fit=crop',
        status: 'Ready to Move',
        postedDate: 'Apr 21, \'25',
        tags: [],
      ),
    ];
  }
}
