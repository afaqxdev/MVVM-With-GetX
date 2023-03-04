// ignore_for_file: file_names

class UserModel {
  String? token;
  bool? isLogin;
  UserModel({this.token, this.isLogin});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isLogin = json['isLogin'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals, unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['isLogin'] = isLogin;
    return data;
  }
}
