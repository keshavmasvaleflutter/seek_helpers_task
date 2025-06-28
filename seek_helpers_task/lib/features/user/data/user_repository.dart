import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:seek_helpers_task/core/core.dart';


class UserRepository {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  UserRepository();

  Future<List<User>> fetchUsers() async {
    log("Fetching users...");
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        log('Successfully fetched ${jsonData.length} users');
        return jsonData.map((json) => User.fromJson(json)).toList();
      } else {
        log('HTTP Error: ${response.statusCode} - ${response.body}');
        throw _handleError(response.statusCode);
      }
    } on FormatException catch (e) {
      log('JSON Parsing Error: $e');
      throw Exception('Invalid server response format');
    } on http.ClientException catch (e) {
      log('Network Error: $e');
      throw Exception('Check your internet connection');
    } catch (e) {
      log('Unexpected Error: $e');
      throw Exception('Failed to fetch users');
    }
  }

  String _handleError(int statusCode) {
    switch (statusCode) {
      case 403:
        return 'Access forbidden (403). Check network permissions.';
      case 404:
        return 'API endpoint not found (404).';
      case 500:
        return 'Server error (500). Try again later.';
      default:
        return 'HTTP Error: $statusCode';
    }
  }
}