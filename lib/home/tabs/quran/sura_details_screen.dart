import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/app_colors.dart';
import 'package:islami/home/tabs/quran/sura_content_items.dart';
import 'package:islami/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {

  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(verses.isEmpty){
      loadSuraFile(args.fileName);

    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Text(args.suraArName,style: Theme.of(context).textTheme.titleLarge,),
          Container(
            color: AppColors.black,
            child: Image.asset(
              'assets/images/details_screen_bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 20),
              Text(
                args.suraArName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 50),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ))
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return SuraContentItems(content: verses[index],index: index,);
                        },
                        itemCount: verses.length,
                      ),
              )
            ],
          )
        ],
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String suraContent =
        await rootBundle.loadString('assets/files/$fileName');
    List<String> suraLines = suraContent.split('\n');
    for(int i =0; i < suraLines.length; i++){
      print(suraLines[i]);
    }
    verses = suraLines;
    setState(() {

    });
  }
}
