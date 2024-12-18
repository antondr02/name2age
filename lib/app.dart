import 'package:flutter/material.dart';
import 'package:name_to_age/views/name_to_age_page.dart';
import 'package:name_to_age/repository/age_estimate_repository.dart';
import 'package:name_to_age/theme.dart';

class NameToAgeApp extends StatelessWidget {
  const NameToAgeApp({super.key, required this.repository});

  final AgeEstimateRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name2Age',
      theme: appTheme,
      home: NameToAgePage(
        repository: repository,
      ),
    );
  }
}
