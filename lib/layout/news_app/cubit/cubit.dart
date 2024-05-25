import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';

import '../../../modules/business/business_screen.dart';
import '../../../modules/entertainment/entertainment.dart';
import '../../../modules/scinece/scinece.dart';
import '../../../modules/sports/sports.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Scinece',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.games),
      label: 'Entertainment',
    ),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) getBusiness();
    if (index == 1) getSport();
    if (index == 2) getScience();
    if (index == 2) getEntertainment();

    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '80d617fee1f1489296926a8f5662f067',
      },
    ).then((value) {
      // print(value.data.toString());
      business = value.data['articles'];
      print(value.toString());
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> entertainment = [];
  void getEntertainment() {
    emit(NewsGetEntertainmentLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        //'country': 'eg',
        'country': 'us',
        'category': 'entertainment',
        'apiKey': '80d617fee1f1489296926a8f5662f067',
      },
    ).then((value) {
      // print(value.data.toString());
      entertainment = value.data['articles'];
      print(value.toString());
      emit(NewsGetEntertainmentSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetEntertainmentErrorState(error.toString()));
    });
  }

  List<dynamic> sport = [];

  void getSport() {
    emit(NewsGetSportLoadingState());
    if (sport.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '80d617fee1f1489296926a8f5662f067',
        },
      ).then((value) {
        // print(value.data.toString());
        sport = value.data['articles'];
        emit(NewsGetSportSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '80d617fee1f1489296926a8f5662f067',
        },
      ).then((value) {
        print(value.data.toString());
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': '80d617fee1f1489296926a8f5662f067',
      },
    ).then((value) {
      // print(value.data.toString());
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScinceScreen(),
    EntertainmentScreen(),
  ];
}
