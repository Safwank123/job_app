import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/jobs/data/models/job_models.dart';


class SavedJobsCubit extends Cubit<List<JobModel>> {
  SavedJobsCubit() : super([]);

  void toggleSave(JobModel job) {
    if (state.contains(job)) {
      emit(List.from(state)..remove(job));
    } else {
      emit(List.from(state)..add(job));
    }
  }
}
