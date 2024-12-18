import 'package:name_to_age/repository/api_service.dart';
import 'package:name_to_age/models/age_estimate.dart';
import 'package:name_to_age/models/exception_types.dart';

class AgeEstimateRepository {
  const AgeEstimateRepository(this._service);
  final ApiService _service;

  Future<AgeEstimate> getEstimate(String name) async {
    Map<String, dynamic> data = await _service.fetchEstimate(name);

    if (data.isEmpty) {
      throw FetchFailureException(); // Use your custom exception for empty responses
    }

    return AgeEstimate.fromJson(data);
  }
}
