import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_to_age/repository/age_estimate_repository.dart';
import 'package:name_to_age/cubits/name_to_age_state.dart';
import 'package:name_to_age/models/exception_types.dart';

class NameToAgeCubit extends Cubit<NameToAgeState> {
  NameToAgeCubit(this._repository) : super(const NameToAgeState());

  final AgeEstimateRepository _repository;

  void updateEnteredName(String name) {
    emit(NameToAgeState(
      status: state.status,
      estimate: state.estimate,
      errorMessage: state.errorMessage,
      enteredName: name,
    ));
  }

  void resetStatus() {
    emit(const NameToAgeState());
  }

  Future<void> getAgeEstimate(String name) async {
    try {
      emit(
        NameToAgeState.loading(),
      );
      final estimate = await _repository.getEstimate(name);

      // Handle unknown name. Emit a no-result state if age is null.
      if (estimate.age == null) {
        emit(
          NameToAgeState.noResult(estimate),
        );
        return;
      }
      emit(NameToAgeState.success(estimate));
    } on NoInternetException {
      emit(NameToAgeState.failure('Please check your internet connection.'));
    } on TimeoutException {
      emit(NameToAgeState.failure('The request timed out. Please try again.'));
    } on FetchFailureException {
      emit(NameToAgeState.failure(
          'Unable to fetch the age estimate. Please try again.'));
    } on UnexpectedErrorException {
      emit(
        NameToAgeState.failure('Something went wrong. Please try again later.'),
      );
    }
  }
}
