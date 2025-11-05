import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_2/app/app_coordinator/app_coordinator.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  Appcoordinator appcoordinator = Appcoordinator();
  int _dotCount = 0;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _navigateToNext();
    _ticker = Ticker((elapsed) {
      if (elapsed.inMilliseconds % 500 == 0) {
        if (mounted) {
          setState(() {
            _dotCount = (_dotCount + 1) % 4;
          });
        }
      }
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  String get _dots {
    switch (_dotCount) {
      case 0:
        return '';
      case 1:
        return '.';
      case 2:
        return '..';
      case 3:
        return '...';
      default:
        return '';
    }
  }

  _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    appcoordinator.navigateToMain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text('Loading$_dots', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
