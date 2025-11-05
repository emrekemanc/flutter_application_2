import '../../presentation/screens/home_page_view.dart';
import '../../presentation/screens/splash_screen_view.dart';
import '../../presentation/screens/settings_page_view.dart';
import '../../presentation/screens/profile_page_view.dart';
import '../../presentation/screens/list_page_view.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';

class Appcoordinator {
  static final Appcoordinator _instance = Appcoordinator._internal();
  factory Appcoordinator() => _instance;
  Appcoordinator._internal();

  final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    routes: <GoRoute>[
      GoRoute(
        path: RoutePaths.home,
        builder: (context, state) => HomePageView(),
      ),
      GoRoute(
        path: RoutePaths.splash,
        builder: (context, state) => SplashScreenView(),
      ),
      GoRoute(
        path: RoutePaths.list,
        builder: (context, state) => ListPageView(),
      ),
      GoRoute(
        path: RoutePaths.profile,
        builder: (context, state) => ProfilePageView(),
      ),
      GoRoute(
        path: RoutePaths.settings,
        builder: (context, state) => Settingspageview(),
      ),
    ],
  );

  Future<void> navigateToSettings() async {
    await router.push(RoutePaths.settings);
  }

  Future<void> navigateToProfile() async {
    await router.push(RoutePaths.profile);
  }

  Future<void> navigateToList() async {
    await router.push(RoutePaths.list);
  }

  Future<void> navigateToMain() async {
    await router.push(RoutePaths.home);
  }

  Future<void> navigateToSplash() async {
    await router.push(RoutePaths.splash);
  }

  void goBack() {
    router.pop();
  }
}

class SplashPageView {}
