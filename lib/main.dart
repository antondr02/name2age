import 'package:flutter/material.dart';
import 'package:name_to_age/repository/age_estimate_repository.dart';
import 'package:name_to_age/repository/api_service.dart';
import 'app.dart';

void main() {
  final service = ApiService();
  final repository = AgeEstimateRepository(service);

  runApp(NameToAgeApp(repository: repository));
}
