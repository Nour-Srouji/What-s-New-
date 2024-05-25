import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_model.dart';
import '../../domain/params/delete_job_params.dart';
import '../../domain/params/user_jobs_params.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/jobs_cubit.dart';
import '../bloc/requests_states.dart';
import '../widgets/user_job_item.dart';
import 'auth_screen.dart';
import 'edit_add_job.dart';

class UserJobsScreen extends StatefulWidget {
  const UserJobsScreen({Key? key}) : super(key: key);

  @override
  State<UserJobsScreen> createState() => _UserJobsScreenState();
}

class _UserJobsScreenState extends State<UserJobsScreen> {
  @override
  Widget build(BuildContext context) {
    AuthCubit cubitAuth = BlocProvider.of<AuthCubit>(context);
    JobsCubit cubit = BlocProvider.of<JobsCubit>(context);
    cubit.getJobs(UserJobsParams(
        userId: ((cubitAuth.state as RequestData).data as UserModel).userId));
    return Scaffold(
      appBar: AppBar(title: Text('Job Opportunities'), actions: [
        IconButton(
            onPressed: () {
              cubitAuth.signOut();
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
              cubit.getJobs(UserJobsParams(
                  userId: ((cubitAuth.state as RequestData).data as UserModel)
                      .userId));
            },
            icon: Icon(Icons.refresh_outlined))
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: cubitAuth,
                ),
                BlocProvider.value(
                  value: cubit,
                ),
              ],
              child: EditAddJob(),
            ),
          ));
        },
      ),
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
                        return UserJobItem(
                          model: jobOpportunity,
                          onDelete: () {
                            cubit.deleteJob(
                                DeleteJobParams(jobId: jobOpportunity.jobId),
                                index);
                          },
                          onEdit: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MultiBlocProvider(
                                      providers: [
                                    BlocProvider.value(
                                      value: cubitAuth,
                                    ),
                                    BlocProvider.value(
                                      value: cubit,
                                    ),
                                  ],
                                      child: EditAddJob(
                                        index: index,
                                      )),
                            ));
                          },
                        );
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
