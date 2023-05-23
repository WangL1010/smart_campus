class StringUtils{

  static bool isEmpty(String? text){
    return text?.isEmpty ?? true;
  }

  static bool isNotEmpty(String? text){
    return text?.isNotEmpty ?? false;
  }
  //是否是手机号码
  static bool isPhone(String phone) {
    if (isEmpty(phone)) {
      return false;
    }
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    bool matched = exp.hasMatch(phone);
    return matched;
  }
}