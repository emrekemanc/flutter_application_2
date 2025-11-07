import 'package:flutter_application_2/data/services/reqres_service.dart';
import 'package:flutter_application_2/domain/entities/user_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ReqresService _service = ReqresService();

  @override
  Future<UserEntitiy> createUser(String name, String job) async {
    final data = await _service.createUser(name, job);
    return UserEntitiy.fromJson(data);
  }

  @override
  Future<UserEntitiy> loginUser(String email, String password) async {
    final data = await _service.loginUser(email, password);
    return UserEntitiy.fromJson(data);
  }
}
