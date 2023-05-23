import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:smart_campus/app/http/src/exception/handle_exception.dart';
import 'package:smart_campus/app/http/src/net_request_callback.dart';
import 'package:smart_campus/data/bean/common/base_response.dart';

/// 请求方法
enum DioMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
}

class Http {
  /// 单例模式
  static Http? _instance;

  factory Http() => _instance ?? Http._internal();

  static Http? get instance => _instance ?? Http._internal();

  /// 连接超时时间
  static const int connectTimeout = 60 * 1000;

  /// 响应超时时间
  static const int receiveTimeout = 60 * 1000;

  /// Dio实例
  static Dio _dio = Dio();

  /// 初始化
  Http._internal() {
    // 初始化基本选项
    BaseOptions options = BaseOptions(
        baseUrl: 'http://124.221.75.237:8080/',
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout);
    _instance = this;
    // 初始化dio
    _dio = Dio(options);
    // 添加拦截器
    _dio.interceptors
      ..add(InterceptorsWrapper(onResponse: _onResponse, onError: _onError))
      ..add(buildResponseBusinessInterceptors());
    openLog();
  }

  /// 相应拦截器
  void _onResponse(var response, ResponseInterceptorHandler handler) async {
    // 请求成功是对数据做基本处理
    if (response.statusCode == 200) {
      // ....
      //print(response.toString());
    } else {
      // ....
    }
    if (response.requestOptions.baseUrl.contains("???????")) {
      // 对某些单独的url返回数据做特殊处理
    }
    handler.next(response);
  }

  /// 错误处理
  void _onError(DioError error, ErrorInterceptorHandler handler) {
    handler.next(error);
  }

  /// 请求类
  Future<T> request<T>(
    String path, {
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? query,
    dynamic data,
    bool? isLoading,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const _methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.put: 'put',
      DioMethod.delete: 'delete',
      DioMethod.patch: 'patch',
      DioMethod.head: 'head'
    };
    options ??= Options(method: _methodValues[method]);
    NetRequestCallback callback = _dealCallback(isLoading ?? false);
    callback.onStart();
    Response? response;
    try {
      response = await _dio.request(
        path,
        data: data,
        queryParameters: query,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      callback.onSuccess(response.data, response: response);
    } catch (e) {
      callback.onError(e as Exception);
    }
    return response?.data;
  }

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

  /// 开启日志打印
  /// 需要打印日志的接口在接口请求前 DioUtil.instance?.openLog();
  void openLog() {
    _dio.interceptors
        .add(LogInterceptor(responseHeader: false, responseBody: true));
  }

  static InterceptorsWrapper buildResponseBusinessInterceptors() {
    return InterceptorsWrapper(onResponse: (Response response, handler) {
      // 处理业务数据的转换
      final Map<String, dynamic> bodyMap = response.data;
      final BaseResponse resp = BaseResponse.fromMap(bodyMap);
      response.data = resp.result;
      handler.next(response);
    });
  }
}
