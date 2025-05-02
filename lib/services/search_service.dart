import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class SearchService {
  // Base URL - replace with your actual API endpoint
  static const String apiBaseUrl = 'http://10.0.2.2:3000/properties';

  // Fetch search data from API
  static Future<Map<String, dynamic>> getSearchResults() async {
    try {
      // Actual API call
      final response = await http.get(Uri.parse('$apiBaseUrl/user/searches'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'recentSearches': data['recentSearches'] ?? [],
          'recommendedSearches': data['recommendedSearches'] ?? [],
          'requested': data['requested'] ?? [],
          'shortlisted': data['shortlisted'] ?? [],
          'contacted': data['contacted'] ?? [],
        };
      }

      // For error cases or development
      return {
        'recentSearches': [],
        'recommendedSearches': [],
        'requested': [],
        'shortlisted': [],
        'contacted': [],
      };
    } catch (e) {
      debugPrint('Error fetching search results: $e');
      // Return empty data structure for error handling
      return {
        'recentSearches': [],
        'recommendedSearches': [],
        'requested': [],
        'shortlisted': [],
        'contacted': [],
      };
    }
  }
}
