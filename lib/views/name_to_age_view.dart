import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_to_age/cubits/name_to_age_cubit.dart';
import 'package:name_to_age/cubits/name_to_age_state.dart';
import 'package:name_to_age/widgets/name_to_age_state_renderer.dart';

class NameToAgeView extends StatelessWidget {
  NameToAgeView({super.key});

  final _formKey = GlobalKey<FormState>();

  void _saveInput(BuildContext context) async {
    final cubit = BlocProvider.of<NameToAgeCubit>(context);
    if (!_formKey.currentState!.validate()) return;
    await cubit.getAgeEstimate(cubit.state.enteredName);
  }

  @override
  Widget build(BuildContext context) {
    Widget buildStateBasedButton(NameToAgeState state, BuildContext context) {
      switch (state.status) {
        case NameToAgeStatus.initial:
          return ElevatedButton(
            onPressed: () => _saveInput(context),
            child: const Text('Get age'),
          );

        case NameToAgeStatus.loading:
          return const ElevatedButton(
            onPressed: null,
            child: Text('Get age'),
          );

        case _:
          return ElevatedButton(
            onPressed: () {
              BlocProvider.of<NameToAgeCubit>(context).resetStatus();
            },
            child: const Text('Restart'),
          );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Name2Age'),
      ),
      body: Center(
        child: BlocBuilder<NameToAgeCubit, NameToAgeState>(
            builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Center(
                    child: NameToAgeStateRenderer(state: state),
                  ),
                ),
                const SizedBox(height: 24),
                buildStateBasedButton(state, context),
              ],
            ),
          );
        }),
      ),
    );
  }
}
