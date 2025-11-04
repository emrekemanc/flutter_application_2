import 'package:flutter/material.dart';
import 'package:flutter_application_2/app_coordinator.dart';
import 'package:flutter_application_2/custom_button.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final appcoordinator = Appcoordinator();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: appcoordinator.navigatorKey,
      initialRoute: appcoordinator.initialRoute,
      routes: appcoordinator.routes,
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        icon: Icons.settings,
                        onPressed: () {
                          appcoordinator.navigateToSettings();
                        },
                      ),
                      CustomIconButton(
                        icon: Icons.list,

                        onPressed: () {
                          appcoordinator.navigateToList();
                        },
                      ),
                      CustomIconButton(
                        icon: Icons.verified_user,

                        onPressed: () {
                          appcoordinator.navigateToProfile();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
