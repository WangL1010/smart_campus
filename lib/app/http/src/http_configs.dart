import 'package:dio/dio.dart';

/// http网络配置
class HttpConfig {
  // 禁用实例化HttpConfig类
  HttpConfig._();

  // 超时时间 20s
  static const int TIME_OUT = 20000;

  // 发送超时时间 20s
  static const int SEND_TIMEOUT = 20000;

  // 接收超时时间 20s
  static const int RECEIVE_TIMEOUT = 20000;

  // 请求内容类型 json，UTF-8
  static const String CONTENT_TYPE_JSON = Headers.jsonContentType;

  // 请求内容类型 form，UTF-8
  static const String CONTENT_TYPE_FORM = 'multipart/form-data;charset=utf-8';

  // body key，用于组装加签内容
  static const String BODY_KEY = 'payload';

  static const String HEADER_PUBLIC_PARAMETER = "x-ehi-public-parameter";
  static const String HEADER_TOKEN = "authorization";
  static const String TOKEN = 'token';
  static const String HEADER_CONTENT_SIGN = "x-ehi-sign";
  static const String HEADER_CONTENT_TYPE = "content-type";
}
