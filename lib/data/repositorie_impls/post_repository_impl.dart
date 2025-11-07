import 'package:flutter_application_2/data/services/jsonplaceholder_service.dart';
import 'package:flutter_application_2/domain/entities/post_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final JsonplaceholderService _service;

  PostRepositoryImpl(this._service);

  @override
  Future<List<PostEntitiy>> getPosts() async {
    final data = await _service.getPosts();
    return data.map<PostEntitiy>((json) => PostEntitiy.fromJson(json)).toList();
  }
}
