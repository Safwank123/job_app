import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/jobs/data/models/job_models.dart';
import '../../data/datasources/job_remote_data_source.dart';


class JobCubit extends Cubit<List<JobModel>> {
  JobCubit() : super([]) {
    fetchJobs();
  }

  final JobRemoteDataSource _dataSource = JobRemoteDataSource();

 Future<void> fetchJobs() async {
  try {
    final jobs = await _dataSource.fetchJobs();
    print("Fetched jobs: ${jobs.length}");
    emit(jobs);
  } catch (e) {
    print("Error fetching jobs: $e");
    emit([]);
  }
}

}
