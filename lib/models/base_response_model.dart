class BaseResponseModel {
  bool isSuccess;
  dynamic data;

  BaseResponseModel({this.isSuccess = false, this.data});
}
