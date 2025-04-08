import 'package:dio/dio.dart';
import '../models/job_models.dart';

class JobRemoteDataSource {
  final Dio _dio = Dio();

  Future<List<JobModel>> fetchJobs() async {
    try {
      final response = await _dio.get('https://remotive.io/api/remote-jobs');
      final data = response.data['jobs'] as List;

      return data.map((e) => JobModel.fromJson(e)).toList();
    } catch (e) {
      print("API fetch error: $e");
      return [];
    }
  }
}
