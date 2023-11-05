import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sprung/sprung.dart';

class WelcomeCarousel extends StatelessWidget {
  const WelcomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayCurve: Sprung.overDamped,
        viewportFraction: 0.5,
        autoPlayAnimationDuration: const Duration(seconds: 4),
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: [1, 2, 3, 4, 5, 6, 7].map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              return SvgPicture.asset(
                'assets/ui_kit/emotion_id/emotion_$i.svg',
                width: 150.w,
                color: Colors.primaries[Random().nextInt(
                  Colors.primaries.length,
                )],
              );
            },
          );
        },
      ).toList(),
    );
  }
}
