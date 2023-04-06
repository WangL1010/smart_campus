import 'package:get/get.dart';

import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  onJumpPage(int index) {
    state.currentIndex = index;
    state.controller.jumpToPage(index);
    update();
  }
}
