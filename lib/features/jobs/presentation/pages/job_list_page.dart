import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/jobs/data/models/job_models.dart';
import 'package:job_app/features/jobs/presentation/pages/saved_jobs_page.dart';
import '../../../theme/cubit/theme_cubit.dart';
import '../cubit/job_cubit.dart';
import '../widgets/job_tile.dart';

class JobListPage extends StatelessWidget {
  const JobListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JobCubit()..fetchJobs(), 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jobs'),
          actions: [
            IconButton(
              icon: const Icon(Icons.bookmark),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SavedJobsPage()),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            )
          ],
        ),
        body: BlocBuilder<JobCubit, List<JobModel>>(
          builder: (context, jobs) {
            if (jobs.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (_, i) => JobTile(job: jobs[i]),
            );
          },
        ),
      ),
    );
  }
}
