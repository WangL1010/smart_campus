class BaseResponse {
  static const int SUCCESS_CODE = 0;
  dynamic result;
  late final int errorCode;
  late final String message;

  BaseResponse._({this.errorCode = -1, this.message = "", this.result});

  static BaseResponse fromMap(Map<String, dynamic> map) {
    return BaseResponse._(errorCode: map['errorCode'], message: map['message'], result: map['result']);
  }
}
