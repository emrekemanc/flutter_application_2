import 'package:flutter/material.dart';
import 'package:flutter_application_2/app_coordinator.dart';
import 'package:flutter_application_2/custom_button.dart';

class ProfilePageView extends StatelessWidget {
  final appcoordinator = Appcoordinator();
  ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page View'),
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
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(""),
          ],
        ),
      ),
    );
  }
}
