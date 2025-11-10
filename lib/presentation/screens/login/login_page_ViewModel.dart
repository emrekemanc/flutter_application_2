import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/app_coordinator/app_coordinator.dart';
import 'package:flutter_application_2/data/repositorie_impls/user_repository_impl.dart';
import 'package:flutter_application_2/domain/entities/login_entitiy.dart';
import 'package:flutter_application_2/domain/usecases/user_usecases/create_user_usecase.dart';

class LoginPageViewModel extends ChangeNotifier {
  final LoginEntitiy _formData = LoginEntitiy();
  final CreateUserUsecase _createUserUsecase = CreateUserUsecase(
    UserRepositoryImpl(),
  );
  final Appcoordinator _appCoordinator;

  String? _errorMessage;

  LoginPageViewModel(this._appCoordinator);

  LoginEntitiy get formData => _formData;
  String? get errorMessage => _errorMessage;

  void setEmail(String value) {
    _formData.email = value.trim();
  }

  void setPassword(String value) {
    _formData.password = value;
  }

  Future<void> login() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      _errorMessage = null;
      final response = await _createUserUsecase.call(
        _formData.email.toString(),
        "dev",
      );
      _appCoordinator.navigateToMain();
      print(response.name);
    } catch (e) {
      _errorMessage = 'Login failed. Please try again.';
      notifyListeners();
    }
  }
}
