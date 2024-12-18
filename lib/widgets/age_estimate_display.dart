import 'package:flutter/material.dart';
import 'package:name_to_age/models/age_estimate.dart';

class AgeEstimateDisplay extends StatelessWidget {
  const AgeEstimateDisplay(
    this.estimate, {
    super.key,
  });

  final AgeEstimate estimate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${estimate.name} is on average',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        Text(
          '${estimate.age}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'years old.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
