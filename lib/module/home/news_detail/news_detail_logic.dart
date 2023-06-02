import 'package:get/get.dart';

import 'news_detail_state.dart';

class NewsDetailLogic extends GetxController {
  final NewsDetailState state = NewsDetailState();

  @override
  void onReady() {
    super.onReady();
    state.configData();
    update();
  }
}
