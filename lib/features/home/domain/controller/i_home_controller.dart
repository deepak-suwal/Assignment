import 'package:injectable/injectable.dart';

import '../../data/model/post_model.dart';
import '../repository/i_home_repository.dart';

abstract class IHomeController {
  Future<(List<PostModel>, int)> fetchPosts();
}

@Injectable(as: IHomeController)
class HomeController extends IHomeController {
  IHomeRepository repository;

  HomeController(this.repository);

  @override
  Future<(List<PostModel>, int)> fetchPosts() {
    return repository.fetchPosts();
  }
}
