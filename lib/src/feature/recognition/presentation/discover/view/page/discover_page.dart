import 'package:auto_route/auto_route.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/presentation/presentation.dart';
import 'package:flutter/cupertino.dart';

@RoutePage(name: 'Discover')
class DiscoverPage extends StatelessWidget {
  const DiscoverPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DiscoverBody();
  }
}
