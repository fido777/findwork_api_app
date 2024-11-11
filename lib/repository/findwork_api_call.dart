import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/findwork_api_response.dart';

class FindworkApiCall {
  static Future<FindworkApiResponse> fetchJobs() async {
    const String apiUrl = 'https://findwork.dev/api/jobs/';
    const String apiKey = '6c1d8a165ec2c4b81aa363c4448ee6a38ae3bf62';

    final http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': 'Token $apiKey'},
    );
    log(response.body,
        level: 200, name: 'FindworkApiCall.fetchJobs()');
    if (response.statusCode == 200) {
      return FindworkApiResponse.fromJson(response.body);
    } else {
      throw JobsLoadingException('Falla al cargar los trabajos.');
    }
  }
}

class JobsLoadingException implements Exception {
  JobsLoadingException(String s);
}
