import 'package:flutter_application_2/domain/entities/user_entitiy.dart';

abstract class UserRepository {
  Future<UserEntitiy> loginUser(String email, String password);
  Future<UserEntitiy> createUser(String name, String job);
}
