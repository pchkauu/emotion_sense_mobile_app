import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class IntroductionBackground extends StatefulWidget {
  final Widget child;

  const IntroductionBackground({
    super.key,
    required this.child,
  });

  @override
  State<IntroductionBackground> createState() => _IntroductionBackgroundState();
}

class _IntroductionBackgroundState extends State<IntroductionBackground>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(
        options: ParticleOptions(
          baseColor: Colors.accents[Random().nextInt(
            Colors.accents.length,
          )],
          spawnMaxRadius: 40,
          spawnMinSpeed: 35,
          spawnMaxSpeed: 75,
          particleCount: 20,
        ),
      ),
      vsync: this,
      child: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            baseColor: Colors.accents[Random().nextInt(
              Colors.accents.length,
            )],
            spawnMaxRadius: 15,
            spawnMinSpeed: 16,
            spawnMaxSpeed: 107,
            particleCount: 25,
          ),
        ),
        vsync: this,
        child: widget.child,
      ),
    );
  }
}
