
import 'package:abdullaa/lay_out/todo_app/Home_Screen.dart';
import 'package:abdullaa/moduls/counter/counter_screen.dart';
import 'package:abdullaa/shared/network/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lay_out/news_app/cubit/cubit.dart';
import 'lay_out/news_app/news_app.dart';
import 'moduls/user/user_screen.dart';
import 'shared/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  Dio_Helper.init();
  runApp( MyApp());
}
class   MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newsappcubit()..getBusiness()..getSports()..getScience()..getHealth(),
      child: MaterialApp(
        theme: ThemeData(
         primarySwatch: Colors.blueGrey,

          scaffoldBackgroundColor: Colors.white,

          appBarTheme: AppBarTheme(

            iconTheme: IconThemeData(
              color: Colors.white
            ),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22,
            ),
            systemOverlayStyle:SystemUiOverlayStyle(
               statusBarColor: Colors.white,
              statusBarIconBrightness:Brightness.dark,

            ),
            elevation: 0,
            color: Colors.white,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
          ),
        ),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home:   News_App (),
      ),
    );
  }
}
