class AgeEstimate {
  const AgeEstimate({required this.name, required this.age});

  final String name;

  /// Nullable because age is not provided for unsuccessful lookups
  final int? age;

  // Create an instance from JSON
  factory AgeEstimate.fromJson(Map<String, dynamic> json) {
    return AgeEstimate(
      name: json['name'],
      age: json['age'],
    );
  }
}
