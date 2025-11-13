import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_coordinator/app_coordinator.dart';
import 'package:flutter_application_2/presentation/customs/custom_button.dart';

class Settingspageview extends StatelessWidget {
  Settingspageview({super.key});
  final appcoordinator = Appcoordinator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page View'),
        actions: [
          CustomIconButton(
            icon: Icons.home,

            onPressed: appcoordinator.navigateToMain,
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, size: 100),
            SizedBox(height: 20),
            Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Adjust your preferences here.'),
          ],
        ),
      ),
    );
  }
}
