import 'package:get/get.dart';

import 'notify_detail_state.dart';

class NotifyDetailLogic extends GetxController {
  final NotifyDetailState state = NotifyDetailState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    state.configData();
    update();
  }
}
