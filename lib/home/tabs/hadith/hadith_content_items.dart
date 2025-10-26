import 'package:flutter/material.dart';

import '../../app_colors.dart';

class HadithContentItems extends StatelessWidget {
  HadithContentItems({super.key, required this.content, });

  String content;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        child: Text(
          content ,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.primary, fontSize: 22),
        ),
      ),
    );
  }
}
