import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<PermissionStatus> requestPermission(Permission permission) async {
    return permission.request();
  }

  Future<bool> permissionHandler(
    BuildContext context,
    Permission permission,
  ) async {
    final status = await requestPermission(permission);
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      if (!context.mounted) return false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${permission.toString().split('.').last} permission denied',
          ),
        ),
      );
      await permission.request();
    } else if (status.isPermanentlyDenied) {
      if (!context.mounted) return false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${permission.toString().split('.').last} permission permanently denied. Please enable it from settings.',
          ),
        ),
      );
      await Future<void>.delayed(const Duration(seconds: 2));
      await openAppSettings();
    }
    return false;
  }
}
