import 'package:flutter_application_2/domain/entities/user_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/user_repository.dart';

class CreateUserUsecase {
  final UserRepository repository;
  final String name;
  final String job;

  CreateUserUsecase(this.repository, this.name, this.job);
  Future<UserEntitiy> call() async => repository.createUser(name, job);
}
