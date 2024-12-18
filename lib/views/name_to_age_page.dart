import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_to_age/cubits/name_to_age_cubit.dart';
import 'package:name_to_age/repository/age_estimate_repository.dart';
import 'package:name_to_age/views/name_to_age_view.dart';

class NameToAgePage extends StatelessWidget {
  const NameToAgePage({required this.repository, super.key});

  final AgeEstimateRepository repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NameToAgeCubit(repository),
      child: NameToAgeView(),
    );
  }
}
