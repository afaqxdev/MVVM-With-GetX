import '../../../res/api_url/api_url.dart';
import '../../network/network_api_services.dart';

class LoginRespository {
  final _apiService = NetworkApiServices();
  Future<dynamic> loginApi(var data) async {
    dynamic response = _apiService.postApi(data, ApiUrl.loginUrl);
    return response;
  }
}
