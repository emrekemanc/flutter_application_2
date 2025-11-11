import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<PermissionStatus> requestPermission(Permission permission) async {
    return await permission.request();
  }

  Future<bool> permissionHandler(
    BuildContext context,
    Permission permission,
  ) async {
    PermissionStatus status = await requestPermission(permission);
    if (status.isGranted) {
      print("true");
      return true;
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${permission.toString().split('.').last} permission denied',
          ),
        ),
      );
      permission.request();
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${permission.toString().split('.').last} permission permanently denied. Please enable it from settings.',
          ),
        ),
      );
      await Future.delayed(const Duration(seconds: 2));
      await openAppSettings();
    }
    return false;
  }
}
