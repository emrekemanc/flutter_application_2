import 'package:flutter/material.dart';
import 'package:flutter_application_2/app_coordinator.dart';
import 'package:flutter_application_2/custom_button.dart';

class Settingspageview extends StatelessWidget {
  final appcoordinator = Appcoordinator();
  Settingspageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page View'),
        actions: [
          CustomIconButton(
            icon: Icons.home,

            onPressed: () {
              appcoordinator.navigateToMain();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.settings, size: 100),
            SizedBox(height: 20),
            Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Adjust your preferences here."),
          ],
        ),
      ),
    );
  }
}
