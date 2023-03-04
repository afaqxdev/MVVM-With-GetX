import 'package:mvvm/model/home_model/user_list_model.dart';

import '../../res/api_url/api_url.dart';
import '../../data/network/network_api_services.dart';

class HomeRespository {
  final _apiService = NetworkApiServices();
  Future<UserListModel> userListApi() async {
    dynamic response = await _apiService.getApi(ApiUrl.userListUrl);
    return UserListModel.fromJson(response);
  }
}
