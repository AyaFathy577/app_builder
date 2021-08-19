import 'package:app_builder/models/post.dart';
import 'package:app_builder/services/posts_service.dart';
import 'package:flutter/material.dart';

class PostsProvider extends ChangeNotifier {
  List<Post> _posts = [];
  Post _post = Post();
  PostsService _postsService = PostsService();

  List<Post> get posts => _posts;

  Post get post => _post;

  Future getAllPosts(String apiName) async {
    var data = await _postsService.getAllPosts(apiName);
    data.forEach((element) {
      _posts.add(Post.fromJson(element));
    });
    notifyListeners();
  }

  Future getPostsByUserId(
      {@required String? apiName, @required int? userId}) async {
    List data =
        await _postsService.getPostsByUserId(apiName: apiName, userId: userId);
    if (data.isNotEmpty) {
      _posts = [];
      data.forEach((element) {
        _posts.add(Post.fromJson(element));
      });
      notifyListeners();
    } else {
      print("user id is unknown");
      getAllPosts(apiName!);
    }
  }
}
