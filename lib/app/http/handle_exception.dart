import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

typedef CommonExceptionTip = Function(String message);

/// 处理接口异常
///
/// 无法辨识的错误，属于[Exception]或者[Error]类型
/// Feature要求用Object去接，大概因为考虑要兼容这两个类型吧
class ExceptionHandler {
  ExceptionHandler._();

  static handleException(dynamic e, CommonExceptionTip tip) {
    if (e == null) {
      return;
    }
    e = e is DioError ? e.error : e;
    String message;
    if (e is JsonUnsupportedObjectError) {
      message = "数据解析失败，请稍后重试!";
    } else if (e is SocketException) {
      message = "网络连接失败，请检查网络连接!";
    } else if (e is Exception) {
      message = e.toString();
    } else {
      message = "请求错误，请稍后重试!";
    }
    tip(message);
  }
}
