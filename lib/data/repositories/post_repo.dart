import 'package:api_handle_dio/data/models/post_model.dart';
import 'package:api_handle_dio/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepo {
  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response res = await api.sendRequest.get('/posts');
      List<dynamic> postMaps = res.data;
      return postMaps.map((postJson) => PostModel.fromJson(postJson)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
