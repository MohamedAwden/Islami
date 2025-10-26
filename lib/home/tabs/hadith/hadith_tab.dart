import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/tabs/hadith/hadith_details_screen.dart';
import 'package:islami/models/hadith_model.dart';

import '../../app_colors.dart';

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) {
      loadHadithFile();
    }
    return Column(
      children: [
        Image.asset('assets/images/logo.png'),
        CarouselSlider.builder(
          itemCount: hadithList.length,
          itemBuilder: (context, index, realIndex) => InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(HadithDetailsScreen.routeName, arguments: hadithList[index]);
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primary,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/hadith_element_bg.png',
                  ),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    hadithList[index].title,
                    style: TextStyle(fontSize: 25),
                  ),
                  Expanded(
                    child: Text(
                      hadithList[index].content.join(""),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height*0.7,
            viewportFraction: 0.75,
            enlargeCenterPage: true,
          ),
        ),
      ],
    );
  }

  void loadHadithFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
          await rootBundle.loadString('assets/files/hadeeth/h$i.txt');
      List<String> hadithLines = hadithContent.split('\n');
      String title = hadithLines[0]; //// كده جبنا title
      hadithLines.removeAt(0); // we had removed the title from the main list
      HadithModel hadithModel = HadithModel(title: title, content: hadithLines);
      hadithList.add(hadithModel);

      setState(() {});
    }
  }
}
