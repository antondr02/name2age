import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_to_age/cubits/name_to_age_cubit.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 30,
      decoration: InputDecoration(
        label: const Text('Name'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            value.trim().length <= 1 ||
            value.trim().length > 30) {
          return 'Must be between 1 and 30 characters';
        }
        return null;
      },
      onChanged: (value) {
        BlocProvider.of<NameToAgeCubit>(context).updateEnteredName(value);
      },
    );
  }
}
