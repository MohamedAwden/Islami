import 'package:flutter/material.dart';
import 'package:islami/home/app_colors.dart';
import 'package:islami/models/sura_model.dart';

class SuraListWidget extends StatelessWidget {
  SuraListWidget(
      {required this.suraModel,required this.index});

  SuraModel suraModel ;
  int index ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/vector_image.png'),
            Text(
              '${index+1}',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 20)),

          ],
        ),
        SizedBox(width: 24,),
        Expanded(
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '${suraModel.suraEnName}',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 20)),

                  Text(
                    '${suraModel.numberOfVerses} Verses',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 20)),

                ],
              ),

              Text(
                '${suraModel.suraArName}',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 20)),

            ],
          ),
        ),
      ],
    );
  }
}
