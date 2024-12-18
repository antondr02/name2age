import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:name_to_age/models/exception_types.dart';

import 'package:http/http.dart' as http;

class ApiService {
  final String apiHttpsPath = 'api.agify.io';

  /// Fetches an object containing the estimated age for a given name. Age will be null if the name doen't exist.
  Future<Map<String, dynamic>> fetchEstimate(String name) async {
    final Uri url = Uri.https(apiHttpsPath, '', {'name': name});

    // Handle connection level errors
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      // Handle HTTP errors
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw FetchFailureException();
      }
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw TimeoutException();
    } catch (e) {
      throw UnexpectedErrorException('Unexpected error: $e');
    }
  }
}
