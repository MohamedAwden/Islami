import 'package:flutter/material.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/home/my_theme_data.dart';
import 'package:islami/home/tabs/quran/sura_details_screen.dart';
import 'package:islami/home/tabs/quran/sura_details_screen.dart';

import 'home/tabs/hadith/hadith_details_screen.dart';

void main(){
  runApp(MyApp());
}

  class  MyApp extends StatelessWidget {
    const MyApp ({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName : (context)=>HomeScreen(),
          SuraDetailsScreen.routeName : (context)=>SuraDetailsScreen(),
          HadithDetailsScreen.routeName : (context)=>HadithDetailsScreen(),
        },
        initialRoute:HomeScreen.routeName ,
        darkTheme: MyThemeData.darkTheme,
        themeMode: ThemeMode.dark,
      );
    }
  }

