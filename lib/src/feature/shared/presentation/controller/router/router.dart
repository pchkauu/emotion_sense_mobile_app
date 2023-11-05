import 'package:auto_route/auto_route.dart';
import 'package:emotion_sense_mobile_app/src/feature/welcome/presentation/presentation.dart';

part 'router.gr.dart';

final router = AppRouter().config();

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: Welcome.page,
          path: '/',
        ),
        AutoRoute(
          page: Introduction.page,
          path: '/introduction',
        ),
      ];
}
