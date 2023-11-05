import 'package:auto_route/auto_route.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/presentation/presentation.dart';
import 'package:emotion_sense_mobile_app/src/feature/welcome/presentation/presentation.dart';

part 'router.gr.dart';

final router = AppRouter().config();

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: Welcome.page,
          path: '/',
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: Introduction.page,
          path: '/introduction',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: Recognition.page,
          path: '/recognition',
          transitionsBuilder: TransitionsBuilders.fadeIn,
          children: [
            CustomRoute(
              page: Hidden.page,
              path: "_hidden",
            ),
            CustomRoute(
              page: Discover.page,
              path: "_discover",
            ),
            CustomRoute(
              page: Study.page,
              path: "_study",
            ),
            CustomRoute(
              page: Static.page,
              path: "_static",
            ),
          ],
        ),
      ];
}
