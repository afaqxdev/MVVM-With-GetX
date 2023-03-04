import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/login_model/userModel.dart';

class Userpreference {
  Future<bool> saveUser(UserModel userModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('toke', userModel.token.toString());
    sp.setBool('isLogin', userModel.isLogin!);

    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('toke');
    bool? isLogin = sp.getBool('isLogin');

    return UserModel(token: token, isLogin: isLogin);
  }

  Future<bool> reomveUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
