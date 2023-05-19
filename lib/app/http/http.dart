import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:net_request_lib/net_request_lib.dart';
import 'package:smart_campus/app/http/base_url.dart';

import 'package:dio/dio.dart';

///直接使用静态方法访问
class Http {
  static HttpProxy get instance => HttpProxy.instance;

  ///get请求
  ///二次封装：如果自己实现回调，弹出及其错误回调需要手动处理
  static Future<dynamic> get(
    String path, {
    bool isLoading = true,
    Map<String, dynamic>? query,
    Options? options,
    NetRequestCallback? callback,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return instance.get(
      path,
      query: query,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      isLoading: isLoading,
      callback: callback,
    );
  }

  ///post请求
  ///二次封装：如果自己实现回调，弹出及其错误回调需要手动处理
  static Future<dynamic> post(
    String url,
    dynamic data, {
    bool isLoading = true,
    Options? options,
    NetRequestCallback? callback,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return instance.post(
      url,
      data ?? '',
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      isLoading: isLoading,
      callback: callback,
    );
  }

  ///request请求
  ///二次封装：如果自己实现回调，弹出及其错误回调需要手动处理
  static Future<dynamic> request(String url, String method,
      {Options? options,
      Map<String, dynamic>? query,
      dynamic data,
      bool isLoading = true,
      NetRequestCallback? callback,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    return instance.request(
      url,
      method,
      data: (data == null && method != BaseApi.GET) ? '' : data,
      query: query,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      isLoading: isLoading,
      callback: callback,
    );
  }

  /// 上传文件
  /// [data] 文件信息数据
  static Future<dynamic> uploadFile(
      {required FormData data,
      required String uploadUrl,
      bool isLoading = true,
      NetRequestCallback? callback,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    // 提交请求

    return instance.uploadFile(
      data: data,
      uploadUrl: uploadUrl,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      isLoading: isLoading,
      callback: callback,
    );
  }
}

class HttpStatus {
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String DELETE = 'DELETE';
  static const String PUT = 'PUT';
}

///兼容老的网路请求
class HttpProxy extends BaseApi {
  static HttpProxy? _instance;

  factory HttpProxy() => _getInstance();

  static HttpProxy get instance => _getInstance();

  static HttpProxy _getInstance() => _instance ??= HttpProxy._internal();

  HttpProxy._internal();

  ///弹窗及其错误处理
  NetRequestCallback _dealCallback(bool isLoading) {
    return NetRequestCallback(
      start: () {
        if (isLoading) {
          SmartDialog.showLoading();
        }
      },
      error: (e) async {
        if (isLoading) await SmartDialog.dismiss();

        ///报错处理
        ExceptionHandler.handleException(e, (message) {
          SmartDialog.showToast(message);
        });
      },
      success: (_, response) async {
        if (isLoading) await SmartDialog.dismiss();
      },
      complete: () {},
    );
  }

  ///get请求
  ///二次封装：如果自己实现回调，弹出及其错误回调需要手动处理
  @override
  Future<dynamic> get(
    String path, {
    bool isLoading = true,
    Map<String, dynamic>? query,
    Options? options,
    NetRequestCallback? callback,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return super.get(
      path,
      query: query,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      callback: callback ?? _dealCallback(isLoading),
    );
  }

  ///post请求
  ///二次封装：如果自己实现回调，弹出及其错误回调需要手动处理
  @override
  Future<dynamic> post(
    String url,
    dynamic data, {
    bool isLoading = true,
    Options? options,
    NetRequestCallback? callback,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return super.post(
      url,
      data ?? '',
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      callback: callback ?? _dealCallback(isLoading),
    );
  }

  ///request请求
  ///二次封装：如果自己实现回调，弹出及其错误回调需要手动处理
  @override
  Future<dynamic> request(String url, String method,
      {Options? options,
      Map<String, dynamic>? query,
      dynamic data,
      bool isLoading = true,
      NetRequestCallback? callback,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return super.request(
      url,
      method,
      data: (data == null && method != BaseApi.GET) ? '' : data,
      query: query,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      callback: callback ?? _dealCallback(isLoading),
    );
  }

  /// 上传文件
  /// [data] 文件信息数据
  @override
  Future<dynamic> uploadFile(
      {required FormData data,
      required String uploadUrl,
      bool isLoading = true,
      NetRequestCallback? callback,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    // 提交请求

    return super.uploadFile(
      data: data,
      uploadUrl: uploadUrl,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      callback: callback ?? _dealCallback(isLoading),
    );
  }

  @override
  String getBaseUrl() {
    return BaseUrl.baseUrl;
  }

  @override
  void applyOptions(BaseOptions options) {}

  @override
  void logPrint(Object object) {
    print(object);
  }

  @override
  List<Interceptor>? getInterceptors() {
    return [];
  }

  @override
  bool isDebug() {
    return false;
  }
}
