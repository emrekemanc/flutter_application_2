import 'package:flutter_application_2/domain/entities/post_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/post_repository.dart';

class GetPostsUsecase {
  GetPostsUsecase(this.repository);
  final PostRepository repository;

  Future<List<PostEntitiy>> call() async => repository.getPosts();
}
