import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../app/common/bind_widget/get_bind_widget.dart';
import '../../../../app/common/widget/common_text_app_bar.dart';
import 'web_view_logic.dart';

class InAppWebViewPage extends StatelessWidget {
  final logic = Get.put(InAppWebViewLogic());
  final state = Get
      .find<InAppWebViewLogic>()
      .state;

  // final crossPlatformOptions = InAppWebViewOptions(
  //   javaScriptEnabled: true,
  //   useOnDownloadStart: true,
  //   applicationNameForUserAgent: ";android_app/1.0.0",
  // );
  //
  // final androidOptions = AndroidInAppWebViewOptions(
  //   displayZoomControls: true,
  //   mixedContentMode: AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
  // );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InAppWebViewLogic>(builder: (logic) {
      return GetBindWidget(
          child: Scaffold(
            body: Stack(
              children: [
                // InAppWebView(
                //     initialUrlRequest:
                //     URLRequest(url: Uri.parse('http://www.baidu.com/')),
                //     onWebViewCreated: (InAppWebViewController controller) =>
                //         logic.initController(controller),
                //   onLoadStop: (controller, url)=>logic.onLoadStop(),
                //   onProgressChanged: (controller,progress){
                //       SmartDialog.showLoading();
                //   },
                // ),
                WebView(
                  initialUrl:'http://www.baidu.com/',
                ),
              ],
            ),
          ));
    });
  }
}
