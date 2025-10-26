import 'package:flutter/material.dart';
import 'package:islami/extinsions/font_extinsion.dart';

class SalahWidget extends StatelessWidget {
  const SalahWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(13),
      margin: EdgeInsets.symmetric(horizontal: 8,),
      height: 128,
      width: 114,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/salaha_time.png',
            ),
            fit: BoxFit.cover
        ),
      ),
      child: Column(children: [
        Text('ASR', style: context.appFonts.headlineLarge,),
        Text('04:38', style: context.appFonts.headlineLarge?.copyWith(fontSize: 32,),),
        SizedBox(height: 13,),
        Text('PM', style: context.appFonts.headlineLarge,),

      ],),
    );
  }
}
