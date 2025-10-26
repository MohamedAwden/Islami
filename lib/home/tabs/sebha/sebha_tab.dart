import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double turns = 0.0;
  List <String> azkar= ['لااله الا الله','الله اكبر','الحمد الله','سبحان الله '];
  int index =0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// App Logo
          Image.asset('assets/images/logo.png'),

          const SizedBox(height: 16),

          /// Verse Text
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 32),

          /// Sebha
          Stack(
            alignment: Alignment.center,
            children: [
              /// Sebha body (rotatable part)
              GestureDetector(
                onTap: () {
                  counter++;
                  turns += .04 ; // smooth step
                  if (counter == 30 ){
                    index ++;
                    counter = 0;
                  }
                  if(index == azkar.length){
                    index =0;
                  }
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration(milliseconds: 500), // ✅ smoother
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/sebha_body.png'),
                  ),
                ),
              ),

              /// Dhikr text + Counter inside Sebha circle
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${azkar[index]}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Text(
                      '$counter',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              /// Sebha head (fixed position)
              Positioned(
                top: -9,
                right: 125,
                child: Image.asset('assets/images/sebha_head.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
