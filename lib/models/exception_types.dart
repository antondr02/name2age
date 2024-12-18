abstract class NameToAgeException implements Exception {}

class NoInternetException implements NameToAgeException {}

class TimeoutException implements NameToAgeException {}

class FetchFailureException implements NameToAgeException {}

class UnexpectedErrorException implements NameToAgeException {
  final String message;
  UnexpectedErrorException(this.message);
}
