import 'package:flutter_application_2/domain/entities/user_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/user_repository.dart';

class CreateUserUsecase {
  final UserRepository repository;

  CreateUserUsecase(this.repository);
  Future<UserEntitiy> call(String name, String job) async =>
      repository.createUser(name, job);
}
