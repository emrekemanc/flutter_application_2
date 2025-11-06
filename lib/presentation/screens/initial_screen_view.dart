import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_coordinator/app_coordinator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final appcoordinator = Appcoordinator();

  @override
  void initState() {
    super.initState();
    _checkIntroShowed();
  }

  Future<void> _checkIntroShowed() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool seen = (preferences.getBool('seen') ?? false);

    if (mounted) {
      if (seen) {
        appcoordinator.navigateToLogin();
      } else {
        await preferences.setBool('seen', true);
        appcoordinator.navigateToIntro();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
