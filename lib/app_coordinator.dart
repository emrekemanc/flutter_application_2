import 'package:flutter/material.dart';
import 'settings_page_view.dart';
import 'profile_page_view.dart';
import 'list_page_view.dart';
import 'route_paths.dart';

class Appcoordinator {
  static final Appcoordinator _instance = Appcoordinator._internal();
  factory Appcoordinator() => _instance;
  Appcoordinator._internal();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState? get _navigator => navigatorKey.currentState;

  String get initialRoute => RoutePaths.main;

  Map<String, WidgetBuilder> get routes => {
    RoutePaths.settings: (context) => Settingspageview(),
    RoutePaths.profile: (context) => ProfilePageView(),
    RoutePaths.list: (context) => ListPageView(),
  };

  Future<void> navigateToSettings() async {
    await _navigator?.pushNamed(RoutePaths.settings);
  }

  Future<void> navigateToProfile() async {
    await _navigator?.pushNamed(RoutePaths.profile);
  }

  Future<void> navigateToList() async {
    await _navigator?.pushNamed(RoutePaths.list);
  }

  Future<void> navigateToMain() async {
    await _navigator?.pushNamedAndRemoveUntil(
      RoutePaths.main,
      (route) => false,
    );
  }

  void goBack() {
    _navigator?.pop();
  }
}
