import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProjectsService {
  // Configurable base URL
  static String get baseUrl {
    // You can add Platform.isAndroid check if needed
    return const bool.fromEnvironment('dart.vm.product')
        ? 'https://your-production-api.com' // Production URL
        : 'http://10.0.2.2:3000'; // Development URL for emulator
  }

  // Use proper error handling and HTTP client
  static final http.Client _client = http.Client();

  // Get new projects from API
  static Future<Map<String, dynamic>> getNewProjects({
    String? location,
    int? limit,
  }) async {
    final requestUrl = '$baseUrl/projects_new';
    if (kDebugMode) {
      print('🌐 API Request: $requestUrl');
    } // Debug log

    try {
      final response = await _client.get(
        Uri.parse(requestUrl),
        headers: {'Content-Type': 'application/json'},
      );

      if (kDebugMode) {
        print('📊 API Response Status: ${response.statusCode}');
      } // Debug log
      if (kDebugMode) {
        print('📄 API Response Body: ${response.body.substring(0, 100)}...');
      } // First 100 chars

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load projects: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ API Error: $e');
      } // Debug log
      rethrow;
    }
  }

  // Get projects in a specific location
  static Future<Map<String, dynamic>> getProjectsByLocation(
    String location, {
    int? page,
    int? limit,
  }) async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/projects'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('API Error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('API Error: $e');
      }
      throw Exception('Failed to load projects');
    }
  }

  // Get property details
  static Future<Map<String, dynamic>> getPropertyDetails(int id) async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/properties/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('API Error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('API Error: $e');
      }
      throw Exception('Failed to load property details');
    }
  }

  // Dispose the client when done
  static void dispose() {
    _client.close();
  }
}
