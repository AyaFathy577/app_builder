class MenuItemParameter {
  String? apiName;
  int? userId;
  String? url;

  MenuItemParameter.fromJson(Map<String, dynamic> json) {
    apiName = json['apiName'];
    userId = json['userId'];
    url = json['url'];
  }
}
