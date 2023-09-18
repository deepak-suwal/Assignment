import '../../data/model/post_model.dart';

abstract class IHomeRepository {
  Future<(List<PostModel>, int)> fetchPosts();
}
