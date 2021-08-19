class Post {
  int? id;
  int? userId;
  String? title;
  String? body;

  Post();

  Post.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.userId = json['userId'];
    this.title = json['title'];
    this.body = json['body'];
  }
}
