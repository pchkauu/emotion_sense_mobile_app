import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class RecognitionBackground extends StatefulWidget {
  final Widget child;

  const RecognitionBackground({
    super.key,
    required this.child,
  });

  @override
  State<RecognitionBackground> createState() => _RecognitionBackgroundState();
}

class _RecognitionBackgroundState extends State<RecognitionBackground>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(
        options: ParticleOptions(
          baseColor: Colors.accents[Random().nextInt(
            Colors.accents.length,
          )],
          spawnMaxRadius: 5,
          maxOpacity: 0.2,
          spawnMinSpeed: 5,
          spawnMaxSpeed: 15,
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
            maxOpacity: 0.2,
            spawnMaxRadius: 15,
            spawnMinSpeed: 4,
            spawnMaxSpeed: 10,
            particleCount: 5,
          ),
        ),
        vsync: this,
        child: widget.child,
      ),
    );
  }
}
