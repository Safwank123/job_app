import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../jobs/presentation/pages/job_detail_page.dart';
import '../../presentation/cubit/saved_jobs_cubit.dart';

class SavedJobsPage extends StatelessWidget {
  const SavedJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final savedJobs = context.watch<SavedJobsCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Jobs'),
      ),
      body: savedJobs.isEmpty
          ? const Center(
              child: Text('No saved jobs yet.',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: savedJobs.length,
              itemBuilder: (context, index) {
                final job = savedJobs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JobDetailPage(job: job),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                          Text(
                            job.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 6),

                        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                job.companyName,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                              Text(
                                job.candidateRequiredLocation,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          
                          Text(
                            job.description.length > 80
                                ? '${job.description.substring(0, 80)}...'
                                : job.description,
                            style: const TextStyle(fontSize: 14),
                          ),

                          const SizedBox(height: 12),

                       
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                job.salary.isNotEmpty
                                    ? job.salary
                                    : 'Salary not disclosed',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.green),
                              ),
                              IconButton(
                                icon: const Icon(Icons.bookmark_remove),
                                tooltip: 'Remove from saved',
                                onPressed: () => context
                                    .read<SavedJobsCubit>()
                                    .toggleSave(job),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
