import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class WelcomeBackground extends StatefulWidget {
  final Widget child;

  const WelcomeBackground({
    super.key,
    required this.child,
  });

  @override
  State<WelcomeBackground> createState() => _WelcomeBackgroundState();
}

class _WelcomeBackgroundState extends State<WelcomeBackground>
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
          spawnMaxSpeed: 55,
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
