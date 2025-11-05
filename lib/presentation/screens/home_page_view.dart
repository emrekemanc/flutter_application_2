import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_coordinator/app_coordinator.dart';
import 'package:flutter_application_2/presentation/customs/custom_button.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});
  final appcoordinator = Appcoordinator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
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
    );
  }
}
