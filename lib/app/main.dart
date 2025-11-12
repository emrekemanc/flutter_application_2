import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_coordinator/app_coordinator.dart';
import 'package:flutter_application_2/app/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
      path: 'lib/core/assets/translations',
      assetLoader: const JsonAssetLoader(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  final appcoordinator = Appcoordinator();

  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      routerConfig: appcoordinator.router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
