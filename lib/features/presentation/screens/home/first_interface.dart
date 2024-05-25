import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/presentation/screens/auth_screen.dart';

import '../../../../layout/news_app/news_layout.dart';
import '../../bloc/auth_cubit.dart';
import '../../bloc/jobs_cubit.dart';

class FirstInterface extends StatefulWidget {
  const FirstInterface({Key? key}) : super(key: key);

  @override
  State<FirstInterface> createState() => _FirstInterfaceState();
}

class _FirstInterfaceState extends State<FirstInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: const Center(
                    child: Text(
                      'welcome',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  width: double.infinity,
                  height: 70,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(300, 100),
                          bottomRight: Radius.elliptical(300, 100))),
                ),
                const SizedBox(height: 50),
                InkWell(
                  ///Jobs
                  onTap: () {
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MultiBlocProvider(providers: [
                                BlocProvider(
                                  create: (_) => AuthCubit(),
                                  lazy: false,
                                ),
                                BlocProvider(
                                  create: (_) => JobsCubit(),
                                )
                              ], child: AuthScreen())));
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    width: 200,
                    height: 50,
                    child: const Center(
                        child: Text("Jobs",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25))),
                  ),
                ),
                SizedBox(height: 50),
                InkWell(
                    ////NEWS
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewsLayout()));
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      width: 200,
                      height: 50,
                      child: const Center(
                        child: Text("News",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      ),
                    )),
              ]),
        ));
  }
}
