import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_cubit.dart';
import '../bloc/jobs_cubit.dart';
import '../bloc/requests_states.dart';
import '../widgets/job_item.dart';
import 'auth_screen.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobsCubit cubit = JobsCubit();
    cubit.getJobs();
    return Scaffold(
      appBar: AppBar(title: Text('Jobs'), actions: [
        IconButton(
            onPressed: () {
              AuthCubit cubit = BlocProvider.of<AuthCubit>(context);
              cubit.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                          providers: [
                            BlocProvider.value(
                              value: AuthCubit(),
                            ),
                            BlocProvider.value(
                              value: JobsCubit(),
                            )
                          ],
                          child: AuthScreen(),
                        )),
              );
            },
            icon: Icon(Icons.logout)),
        IconButton(
            onPressed: () {
              cubit.getJobs();
            },
            icon: Icon(Icons.refresh_outlined))
      ]),
      body: BlocBuilder<JobsCubit, RequestState>(
          bloc: cubit,
          builder: (cx, RequestState state) {
            if (state is RequestData) {
              return !state.data.jobs.isNotEmpty
                  ? const Center(
                      child: Text("List is empty..."),
                    )
                  : ListView.builder(
                      itemCount: state.data.jobs.length,
                      itemBuilder: (ctx, index) {
                        final jobOpportunity = state.data.jobs[index];
                        return JobItem(model: jobOpportunity);
                      });
            } else if (state is RequestError) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
