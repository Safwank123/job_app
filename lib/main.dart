
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/jobs/presentation/cubit/saved_jobs_cubit.dart';
import 'features/jobs/presentation/pages/job_list_page.dart';
import 'features/theme/cubit/theme_cubit.dart';

void main() {
   debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(const JobListingApp());
}

class JobListingApp extends StatelessWidget {
  const JobListingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => SavedJobsCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Job Listing App',
            theme: theme,
            home: const JobListPage(),
          );
        },
      ),
    );
  }
}