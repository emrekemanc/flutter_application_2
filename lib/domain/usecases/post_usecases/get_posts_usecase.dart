import 'package:flutter_application_2/domain/entities/post_entitiy.dart';
import 'package:flutter_application_2/domain/repositories/post_repository.dart';

class GetPostsUsecase {
  final PostRepository repository;
  GetPostsUsecase(this.repository);

  Future<List<PostEntitiy>> call() async => await repository.getPosts();
}
