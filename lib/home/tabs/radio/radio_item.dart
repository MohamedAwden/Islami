import 'package:flutter/material.dart';
import 'package:islami/extinsions/font_extinsion.dart';
import 'package:islami/home/app_colors.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      height:height*.155 ,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        image:DecorationImage(image: AssetImage('assets/images/mousqe_bg.png'))
      ),
      child: Column(

        children: [
          Text(
            'Radio Ibrahim Al-Akader',
            style: context.appFonts.titleLarge?.copyWith(
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  size: 35,
                  color: AppColors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow,
                  size: 35,
                  color: AppColors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_up,
                  size: 35,
                  color: AppColors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
