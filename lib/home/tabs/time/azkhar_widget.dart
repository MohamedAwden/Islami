import 'package:flutter/material.dart';
import 'package:islami/extinsions/font_extinsion.dart';

import '../../app_colors.dart';

class AzkharWidget extends StatelessWidget {
  const AzkharWidget({super.key, required this.imagePath,required this.name});
  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 185,
      height: 259,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primary, width: 3)
      ),
      child: Column(children: [
        SizedBox(height: 23,),
        Image.asset(imagePath),
        Text(name,style: context.appFonts.headlineLarge!.copyWith(fontSize: 20),)
      ],),
    );
  }
}
