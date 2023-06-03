import 'package:get/get.dart';
import 'package:smart_campus/module/home/game_info/web_view/web_view_state.dart';
import 'package:smart_campus/module/home/game_info/web_view/web_view_view.dart';

import 'game_detail_state.dart';

class GameDetailLogic extends GetxController {
  final GameDetailState state = GameDetailState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    state.configData();
    update();
  }

  void toWebView() {
    Get.to(InAppWebViewPage(), arguments: {
      InAppWebViewState.keyUrl: 'http://www.baidu.com/',
    });
  }
}
