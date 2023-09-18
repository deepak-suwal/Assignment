import 'package:flutter_assignment/features/home/data/model/post_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/dio_client.dart';
import '../../domain/repository/i_home_repository.dart';

@Injectable(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  DioClient dioClient;

  HomeRepository(this.dioClient);

  @override
  Future<(List<PostModel>, int)> fetchPosts() async {
    List<PostModel> postList = [];
    final response = await dioClient.get('posts?_limit=20');
    if (response?.statusCode == 200) {
      response?.data.forEach((element) {
        postList.add(PostModel.fromJson(element));
      });
    }
    return (postList, response?.statusCode ?? 0);
  }
}
