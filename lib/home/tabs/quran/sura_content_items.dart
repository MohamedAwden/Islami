import 'package:flutter/material.dart';

import '../../app_colors.dart';

class SuraContentItems extends StatelessWidget {
  SuraContentItems({super.key, required this.content, required this.index});

  String content;
  int index;

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        child: Text(
          '$content  [${index + 1}]',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.primary, fontSize: 22),
        ),
      ),
    );
  }
}
