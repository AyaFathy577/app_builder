import 'package:app_builder/config/loaded_app_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class PostsService {
  Future<List<dynamic>> getAllPosts(String apiName) async {
    try {
      Response response = await Dio().get("${LoadedAppData.baseUrl}/$apiName");
      var data = response.data;
      if (response.statusCode == 200) {
        return data;
      } else {
        return [];
      }
    } catch (err) {
      print(err);
      return [];
    }
  }

  Future getPostsByUserId(
      {@required String? apiName, @required int? userId}) async {
    try {
      Response response = await Dio().get(
        "${LoadedAppData.baseUrl}/$apiName",
        queryParameters: {
          "userId": userId,
        },
      );
      var data = response.data;
      if (response.statusCode == 200) {
        return data;
      } else {
        return [];
      }
    } catch (err) {
      print(err);
      return [];
    }
  }
}
