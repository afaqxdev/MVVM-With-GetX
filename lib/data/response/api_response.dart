import 'package:mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.message, this.status, this.data);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.camplete(this.data) : status = Status.COMPELET;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return 'Status :$status \n Message :$message \n Data :$data';
  }
}
