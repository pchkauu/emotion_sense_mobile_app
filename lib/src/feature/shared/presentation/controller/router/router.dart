import 'package:auto_route/auto_route.dart';
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
      ];
}
