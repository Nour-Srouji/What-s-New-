import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/presentation/screens/user_jobs_screen.dart';

import '../../data/models/user_model.dart';
import '../../domain/params/user_params.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/jobs_cubit.dart';
import '../bloc/requests_states.dart';
import '../widgets/my_check_box.dart';
import 'jobs_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isManager = false;
  late final AuthCubit _cubit;
  late final JobsCubit _jobCubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<AuthCubit>(context);
    _jobCubit = BlocProvider.of<JobsCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Manager'),
                MyCheckBox(
                  onChanged: (isChecked) {
                    _isManager = isChecked;
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            BlocConsumer<AuthCubit, RequestState>(
              listener: (context, state) {
                if (state is RequestError) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Authentication Failed'),
                        content: Text(state.errorMessage),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                } else if (state is RequestData) {
                  if ((state.data as UserModel).isManager) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MultiBlocProvider(
                                providers: [
                                  BlocProvider.value(
                                    value: _cubit,
                                  ),
                                  BlocProvider.value(value: _jobCubit)
                                ],
                                child: UserJobsScreen(),
                              )),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MultiBlocProvider(
                                providers: [
                                  BlocProvider.value(
                                    value: _cubit,
                                  ),
                                  BlocProvider.value(value: _jobCubit)
                                ],
                                child: JobsScreen(),
                              )),
                    );
                  }
                }
              },
              builder: (context, state) {
                if (state is RequestLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: const Text('Sign In'),
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).checkUser(
                            UserParams(
                                username: _usernameController.text.trim(),
                                password: _passwordController.text.trim(),
                                isManager: _isManager));
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Register'),
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).addUser(UserParams(
                            username: _usernameController.text.trim(),
                            password: _passwordController.text.trim(),
                            isManager: _isManager));
                      },
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
