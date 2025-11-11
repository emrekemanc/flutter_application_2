import 'package:flutter_application_2/presentation/screens/initial_screen_view.dart';
import 'package:flutter_application_2/presentation/screens/intro_screen_view.dart';
import 'package:flutter_application_2/presentation/screens/login/login_page_View.dart';
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
    initialLocation: RoutePaths.initial,
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
        path: RoutePaths.intro,
        builder: (context, state) => IntroScreenView(),
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
      GoRoute(
        path: RoutePaths.initial,
        builder: (context, state) => InitialScreen(),
      ),
      GoRoute(
        path: RoutePaths.login,
        builder: (context, state) => LoginPageView(),
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
    await router.pushReplacement(RoutePaths.home);
  }

  Future<void> navigateToSplash() async {
    await router.push(RoutePaths.splash);
  }

  Future<void> navigateToIntro() async {
    await router.push(RoutePaths.intro);
  }

  Future<void> navigateToLogin() async {
    await router.push(RoutePaths.login);
  }

  void goBack() {
    router.pop();
  }
}
