import 'package:flutter_application_2/domain/entities/post_entitiy.dart';

abstract class PostRepository {
  Future<List<PostEntitiy>> getPosts();
}
