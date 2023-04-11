import 'package:get/get.dart';

import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();


  @override
  void onReady() {
    super.onReady();
  }

  onJumpPage(int index) {
    state.currentIndex = index;
    state.controller.jumpToPage(index);
    update();
  }
}
