import 'package:flutter_application_2/domain/entities/user_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/user_repository.dart';

class LoginUserUsecase {
  final UserRepository repository;
  LoginUserUsecase(this.repository);
  Future<UserEntitiy> call(String email, String password) async =>
      await repository.loginUser(email, password);
}
