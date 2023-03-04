import 'package:get/get.dart';
import 'package:mvvm/model/home_model/user_list_model.dart';

import '../../../data/response/status.dart';
import '../../../repository/home_repository/home_repository.dart';

class HomeController extends GetxController {
  final api = HomeRespository();
  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;
  void setRxRequest(Status _vlaue) => rxRequestStatus.value = _vlaue;
  void setUserList(UserListModel _vlaue) => userList.value = _vlaue;
  void setError(String _vlaue) => error.value = _vlaue;

  void userApiList() {
    api.userListApi().then((value) {
      setRxRequest(Status.COMPELET);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequest(Status.ERROR);
    });
  }

  void refreshuserApi() {
    setRxRequest(Status.LOADING);
    api.userListApi().then((value) {
      setRxRequest(Status.COMPELET);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequest(Status.ERROR);
    });
  }
}
