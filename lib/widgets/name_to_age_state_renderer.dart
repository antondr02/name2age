import 'package:flutter/material.dart';
import 'package:name_to_age/cubits/name_to_age_state.dart';
import 'package:name_to_age/widgets/age_estimate_display.dart';
import 'package:name_to_age/widgets/name_input.dart';

class NameToAgeStateRenderer extends StatelessWidget {
  const NameToAgeStateRenderer({required this.state, super.key});

  final NameToAgeState state;

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case NameToAgeStatus.initial:
        return const NameInput();

      case NameToAgeStatus.loading:
        return const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(),
        );

      case NameToAgeStatus.success:

        /// In case of NameToAgeStatus.success estimate is non-null with non-null members
        return AgeEstimateDisplay(state.estimate!);

      case NameToAgeStatus.failure:
        return Text(
          state.errorMessage!,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        );

      case NameToAgeStatus.noResult:
        return Text(
          '\'${state.estimate!.name}\' is unknown',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        );
    }
  }
}
