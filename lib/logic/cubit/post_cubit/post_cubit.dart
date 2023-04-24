import 'package:api_handle_dio/data/models/post_model.dart';
import 'package:api_handle_dio/data/repositories/post_repo.dart';
import 'package:api_handle_dio/logic/cubit/post_cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }

  PostRepo postRepo = PostRepo();

  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepo.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}
