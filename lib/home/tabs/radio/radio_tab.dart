import 'package:flutter/material.dart';
import 'package:islami/extinsions/font_extinsion.dart';
import 'package:islami/home/app_colors.dart';
import 'package:islami/home/tabs/radio/radio_item.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            Container(
              decoration: BoxDecoration(
                color: AppColors.iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                labelStyle: context.appFonts.headlineSmall,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelStyle: context.appFonts.headlineLarge,
                indicator: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12)),
                tabs: [
                  Tab(
                    text: 'Radio',
                  ),
                  Tab(
                    text: 'Reciters',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return RadioItem();
                    },
                    itemCount: 21

                  ),
                  Center(
                    child: Text(
                      'Reciters tab content goes here',
                      style: context.appFonts.headlineSmall,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
