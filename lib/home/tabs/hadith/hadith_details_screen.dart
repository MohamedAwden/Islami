import 'package:flutter/material.dart';
import 'package:islami/home/app_colors.dart';
import 'package:islami/home/tabs/hadith/hadith_content_items.dart';
import 'package:islami/models/hadith_model.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen ({super.key});
  static const  String routeName ='hadith_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadithModel;
    return Scaffold(
      appBar: AppBar(),
      body:Stack(
        alignment: Alignment.topCenter,
        children: [
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
                args.title,
                style: TextStyle(color: AppColors.primary),
              ),
              SizedBox(height: 50),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return HadithContentItems(content: args.content[index]);
                  },
                  itemCount: args.content.length,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
