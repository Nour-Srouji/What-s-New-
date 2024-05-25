import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/bloc_observer.dart';
import 'features/presentation/screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(BlocProvider(
      create: (context) => NewsCubit()
        ..getBusiness()
        ..getScience()
        ..getSport(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.red,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.red,
                unselectedItemColor: Colors.grey[700],
                // backgroundColor: Colors.green
              )),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: Root(),
        ),
      )));
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
   
  }
}
