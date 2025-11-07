import 'package:flutter_application_2/domain/entities/user_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/user_repository.dart';

class LoginUserUsecase {
  final UserRepository repository;
  final String email;
  final String password;
  LoginUserUsecase(this.repository, this.email, this.password);
  Future<UserEntitiy> call() async =>
      await repository.loginUser(email, password);
}
