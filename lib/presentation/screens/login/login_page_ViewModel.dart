import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_coordinator/app_coordinator.dart';
import 'package:flutter_application_2/core/utils/validator_utils.dart';
import 'package:flutter_application_2/domain/entity/login_model.dart';

class LoginPageViewModel extends ChangeNotifier {
  final LoginData _formData = LoginData();
  final Appcoordinator appcoordinator = Appcoordinator();
  String? _errorMessage;
  LoginData get formData => _formData;
  String? get errorMessage => _errorMessage;

  void setEmail(String value) {
    _formData.email = value;
  }

  void setPassword(String value) {
    _formData.password = value;
  }

  void goToHome() {
    appcoordinator.navigateToMain();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email must not be empty';
    }

    if (!ValidatorUtils.isValidEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password must not be empty';
    }
    if (!ValidatorUtils.isLengthValid(value, 6)) {
      return 'Password must be 6 over characterr';
    }
    return null;
  }
}
