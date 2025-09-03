import 'package:flutter/material.dart';
import 'package:islami/home/app_colors.dart';
import 'package:islami/home/tabs/hadith/hadith_tab.dart';
import 'package:islami/home/tabs/quran/quran_tab.dart';
import 'package:islami/home/tabs/radio/radio_tab.dart';
import 'package:islami/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int select = 0;
  List<Widget> tabs=
  [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String>backgroundImages =[
    "assets/images/quran_bg.png",
    "assets/images/hadith_bg.png",
    "assets/images/sebha_bg.png",
    "assets/images/radio_bg.png",
    "assets/images/time_bg.png",

  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImages[select],
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          body: tabs[select],
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: select,
            onTap: (index) {
              select = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: builtItemInBottomNavBar(
                  index: 0,
                  imageName: 'icon_quran',
                ),
                label: 'Quran',
              ),
              BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(
                    index: 1,
                    imageName: 'icon_hadith',
                  ),
                  label: 'Hadith'),
              BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(
                    index: 2,
                    imageName: 'icon_sebha',
                  ),
                  label: 'Sebha'),
              BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(
                    index: 3,
                    imageName: 'icon_radio',
                  ),
                  label: 'Radio'),
              BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(
                    index: 4,
                    imageName: 'icon_time',
                  ),
                  label: 'Time'),
            ],
          ),
        ),
      ],
    );
  }

  Widget builtItemInBottomNavBar({required int index, required imageName}) {
    return select == index
        ? Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.iconBg),
            child: ImageIcon(
              AssetImage('assets/images/$imageName.png'),
            ),
          )
        : ImageIcon(
            AssetImage('assets/images/$imageName.png'),
          );
  }
}
