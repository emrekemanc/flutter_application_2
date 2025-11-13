import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_coordinator/app_coordinator.dart';
import 'package:flutter_application_2/data/services/permission_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final appcoordinator = Appcoordinator();
  final PermissionService _permissionService = PermissionService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final granted = await _permissionService.permissionHandler(
        context,
        Permission.camera,
      );
      if (granted) {
        await _checkIntroShowed();
      }
    });
  }

  Future<void> _checkIntroShowed() async {
    final preferences = await SharedPreferences.getInstance();
    final seen = preferences.getBool('seen') ?? false;

    if (mounted) {
      if (seen) {
        await appcoordinator.navigateToLogin();
      } else {
        await preferences.setBool('seen', true);
        await appcoordinator.navigateToIntro();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
