
class InAppWebViewState {
  static const String keyUrl = "keyUrl";

  ///跳转的url,从上个页面获取
  late String url;

  // ///webview控制器
  // late InAppWebViewController controller;

  InAppWebViewState() {
    this..url = '';
  }
}
