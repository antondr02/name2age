import 'package:name_to_age/models/age_estimate.dart';

enum NameToAgeStatus {
  initial,
  loading,
  success,
  failure,
  noResult,
}

class NameToAgeState {
  const NameToAgeState({
    this.status = NameToAgeStatus.initial,
    this.estimate,
    this.errorMessage,
    this.enteredName = '',
  });

  final NameToAgeStatus status;

  /// Contains an AgeEstimate object when the status is `success` or `noResult' For 'noResult' AgeEstimate.age will be null
  final AgeEstimate? estimate;

  /// Holds the error message when the status is `failure`.
  final String? errorMessage;

  /// Stores the current name provided by TextFormField in NameToAgeView.
  final String enteredName;

  factory NameToAgeState.loading() =>
      const NameToAgeState(status: NameToAgeStatus.loading);

  factory NameToAgeState.success(AgeEstimate estimate) =>
      NameToAgeState(status: NameToAgeStatus.success, estimate: estimate);

  factory NameToAgeState.failure(String errorMessage) => NameToAgeState(
      status: NameToAgeStatus.failure, errorMessage: errorMessage);

  factory NameToAgeState.noResult(AgeEstimate estimate) =>
      NameToAgeState(status: NameToAgeStatus.noResult, estimate: estimate);
}
