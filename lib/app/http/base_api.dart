import 'package:dio/dio.dart';

import 'package:smart_campus/app/http/http_configs.dart';
import 'package:smart_campus/app/http/net_request_callback.dart';



abstract class BaseApi {
  // GET请求标识
  static const String GET = 'GET';

  // POST请求标识
  static const String POST = 'POST';
  static const String DELETE = 'DELETE';
  static const String PUT = 'PUT';

  Dio? _dio;

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? query,
    Options? options,
    NetRequestCallback? callback,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _request(path, GET,
        query: query,
        options: options,
        callback: callback,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<dynamic> post(String url, dynamic data,
      {Options? options,
      NetRequestCallback? callback,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return _request(url, POST,
        data: data,
        options: options,
        callback: callback,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<dynamic> request(String url, String method,
      {Map<String, dynamic>? query,
      dynamic data,
      Options? options,
      NetRequestCallback? callback,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return _request(url, method,
        query: query,
        data: data,
        options: options,
        callback: callback,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  /// 上传文件
  ///
  /// [data] 文件信息数据
  Future<dynamic> uploadFile(
      {required FormData data,
      required String uploadUrl,
      NetRequestCallback? callback,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    // 提交请求
    return _request(uploadUrl, POST,
        data: data,
        options: Options(
          // 设置请求头
          headers: {
            HttpConfig.HEADER_CONTENT_TYPE: HttpConfig.CONTENT_TYPE_FORM
          },
          // 设置内容类型为“multipart/form-data”
          contentType: HttpConfig.CONTENT_TYPE_FORM,
        ),
        callback: callback,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  /// 最终请求
  Future<dynamic> _request(
    String url,
    String method, {
    dynamic data,
    Map<String, dynamic>? query,
    Options? options,
    NetRequestCallback? callback,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    // 创建请求方式
    final Options opt = options ?? Options();
    opt.method = method;
    // 开始发送请求
    callback?.onStart();
    Response? response;
    try {
      response = await _getDio().request(
        url,
        options: opt,
        data: data,
        queryParameters: query,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      callback?.onSuccess(response.data, response: response);
    } catch (e) {
      dynamic exception = e is DioError ? e.error : e;
      if (exception is Exception) {
        callback?.onError(e as Exception);
      }
    }
    callback?.onComplete();
    return response?.data;
  }

  /// 获取Dio单例
  Dio _getDio() {
    /// 设计思路：请求拦截器 >> 请求转换器 >> 发起请求 >> 响应转换器 >> 响应拦截器 >> 最终结果
    if (_dio != null) {
      return _dio!;
    }
    final BaseOptions options = BaseOptions();
    _applyCommonOptions(options);
    applyOptions(options);
    _dio = Dio(options);
    _logConfig();
    _applyCommonInterceptors(_dio!);

    /// 自定义 jsonDecodeCallback,
    /// 这里先不解析json的原因是因为后台返回的浮点数（100.0000解析之后变成100.0），解析成json之后验签没法通过，所以这里先直接返回后台返回的字符串
    /// 所以这里把json转换放到验签拦截器里面，验签完成之后转成json
    (_dio!.transformer as DefaultTransformer).jsonDecodeCallback = _trans;
    return _dio!;
  }

  void _applyCommonOptions(BaseOptions options) {
    options.baseUrl = getBaseUrl();
    options.connectTimeout = HttpConfig.TIME_OUT;
    options.sendTimeout = HttpConfig.SEND_TIMEOUT;
    options.receiveTimeout = HttpConfig.RECEIVE_TIMEOUT;
  }

  void _applyCommonInterceptors(Dio dio) {
  }

  static String _trans(String text) {
    return text;
  }

  void _logConfig() {
    if (!isDebug()) {
      return;
    }
    _dio!.interceptors.add(LogInterceptor(
        requestBody: true, responseBody: true, logPrint: logPrint));
  }

  void logPrint(Object object) {
    print(object);
  }

  bool isDebug();

  void applyOptions(BaseOptions options);

  List<Interceptor>? getInterceptors();

  String getBaseUrl();
}
