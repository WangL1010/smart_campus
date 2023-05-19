import 'package:dio/dio.dart';

/// 成功回调函数，返回结果数据，要么是list，要么是map
typedef Success(dynamic data, Response? response);

/// 失败或错误回调函数
typedef Error(Exception e);

/// 网络开始回调
typedef Start();

/// 网络完成回调
typedef Complete();

class NetRequestCallback {
  final Success? _success;
  final Error? _error;
  final Start? _start;
  final Complete? _complete;

  NetRequestCallback(
      {Start? start, Success? success, Error? error, Complete? complete})
      : _start = start,
        _success = success,
        _error = error,
        _complete = complete;

  /// 网络开始回调
  void onStart() {
    if (_start != null) {
      _start!();
    }
  }

  /// 成功回调函数，返回结果数据，要么是list，要么是map
  void onSuccess(dynamic data, {Response? response}) {
    if (_success != null) {
      _success!(data, response);
    }
  }

  /// 失败或错误回调函数
  void onError(Exception e) {
    if (_error != null) {
      _error!(e);
    }
  }

  /// 网络完成回调
  void onComplete() {
    if (_complete != null) {
      _complete!();
    }
  }
}
