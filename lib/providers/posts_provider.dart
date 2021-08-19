import 'package:app_builder/models/post.dart';
import 'package:app_builder/services/posts_service.dart';
import 'package:app_builder/utilities/view_state_enum.dart';
import 'package:flutter/material.dart';

class PostsProvider extends ChangeNotifier {
  List<Post> _posts = [];
  Post _post = Post();
  PostsService _postsService = PostsService();
  ViewState _viewState = ViewState.Done;

  List<Post> get posts => _posts;

  Post get post => _post;

  ViewState get viewState => _viewState;

  Future getAllPosts(String apiName) async {
    _viewState = ViewState.Loading;
    notifyListeners();
    var data = await _postsService.getAllPosts(apiName);
    data.forEach((element) {
      _posts.add(Post.fromJson(element));
    });
    _viewState = ViewState.Done;
    notifyListeners();
  }

  Future getPostsByUserId(
      {@required String? apiName, @required int? userId}) async {
    _viewState = ViewState.Loading;
    notifyListeners();
    List data =
        await _postsService.getPostsByUserId(apiName: apiName, userId: userId);
    if (data.isNotEmpty) {
      _posts = [];
      data.forEach((element) {
        _posts.add(Post.fromJson(element));
      });
      _viewState = ViewState.Done;
      notifyListeners();
    } else {
      print("user id is unknown");
      getAllPosts(apiName!);
    }
  }
}
