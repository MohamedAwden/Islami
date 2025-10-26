import 'package:flutter/material.dart';
import 'package:islami/extinsions/font_extinsion.dart';
import 'package:islami/home/app_colors.dart';
import 'package:islami/home/my_theme_data.dart';
import 'package:islami/home/tabs/time/azkhar_widget.dart';
import 'package:islami/home/tabs/time/salah_widget.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/logo.png'),
          Container(
            height: 301,
            width: 390,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color(0xff856B3F),
              image: DecorationImage(
                image: AssetImage('assets/images/time_salha_bg.png'),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '16 jul',
                          style: context.appFonts.headlineLarge,
                        ),
                        Text(
                          '2024',
                          style: context.appFonts.headlineLarge,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Pray TIme',
                          style: context.appFonts.headlineLarge?.copyWith(
                            color: AppColors.black,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Tuesday',
                          style: context.appFonts.headlineLarge?.copyWith(
                            color: AppColors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '09 muh',
                          style: context.appFonts.headlineLarge,
                        ),
                        Text(
                          '1446',
                          style: context.appFonts.headlineLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 29,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => SalahWidget(),
                    itemCount: 5,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Next Pray - 02:32',
                      style: context.appFonts.headlineLarge?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(width: 83),
                    Image.asset(
                      'assets/images/volume_salha.png', width: 24, height: 24,)
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Text('Azkhar', style: context.appFonts.headlineLarge,),
          SizedBox(height: 31,),
          Row(
            children: [
              AzkharWidget(imagePath: 'assets/images/bell_1.png', name: 'Evening Azkar'),
              AzkharWidget(imagePath: 'assets/images/bell_1.png', name: 'Evening Azkar'),
            ],
          )

        ],
      ),
    );
  }
}
