import 'package:abdullaa/lay_out/news_app/cubit/states.dart';
import 'package:abdullaa/moduls/business/business_screen.dart';
import 'package:abdullaa/moduls/health_screen/health_screen.dart';
import 'package:abdullaa/moduls/science_screen/science_screen.dart';
import 'package:abdullaa/moduls/sports_screen/sports.dart';
import 'package:abdullaa/shared/network/dio_helper.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class newsappcubit extends Cubit<NewsappState>{
  newsappcubit():super(newsinitial());
 static newsappcubit get(context)=>BlocProvider.of(context);
 int currentIndex=0;
 List<BottomNavigationBarItem>bottomItems=[
   BottomNavigationBarItem(
     icon: Icon(
       Icons.business,

     ),
     label: 'Business',

   ),
   BottomNavigationBarItem(
     icon: Icon(
       Icons.sports,

     ),
     label: 'Sports',

   ),
   BottomNavigationBarItem(
     icon: Icon(
       Icons.science,

     ),
     label: 'Science',

   ),
   BottomNavigationBarItem(
     icon: Icon(
       Icons.health_and_safety,

     ),
     label: 'Health',

   ),
 ];
void changeNavbar(int index){
  currentIndex=index;
  emit(changebottomnav());
}
  List<Widget>screens=[
   business_screen(),
    sports_screen(),
    science_screen(),
    health_screen(),


];
List<dynamic>business=[];
void getBusiness(){
  emit(NewsGetBusinessLoadingState());
  Dio_Helper.getData(
    url: 'v2/top-headlines',
    query: {
      'country':'eg',
      'category':'business',
      'apiKey':'0803a9972d064bd8b3b7379123ea164c',



    },
  ).then((value) {
    // print(value.data['articles'][0]['title']);
    business=value.data['articles'];
    print(business[0]['title']);
    emit(NewsGetBusinessSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(NewsGetBusinessErrorState(error.toString()));
  });
}

  List<dynamic>sports=[];
  void getSports(){
    emit(NewsGetSportLoadingState());
    Dio_Helper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'sport',
        'apiKey':'0803a9972d064bd8b3b7379123ea164c',



      },
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      sports=value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportErrorState(error.toString()));
    });
  }

  List<dynamic>sciences=[];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    Dio_Helper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'science',
        'apiKey':'0803a9972d064bd8b3b7379123ea164c',



      },
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      sciences=value.data['articles'];
      print(sciences[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic>health=[];
  void getHealth(){
    emit(NewsGetHealthLoadingState());
    Dio_Helper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'health',
        'apiKey':'0803a9972d064bd8b3b7379123ea164c',



      },
    ).then((value) {
      // print(value.data['articles'][0]['title']);
     health=value.data['articles'];
      print(health[0]['title']);
      emit(NewsGetHealthSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetHealthErrorState(error.toString()));
    });
  }

  List<dynamic>search=[];
  void getSearch(
      String value,
      ){
    emit(NewsGetSearchLoadingState());
    search=[];
    Dio_Helper.getData(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'0803a9972d064bd8b3b7379123ea164c',



      },
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }



}