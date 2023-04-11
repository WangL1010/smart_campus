import 'package:get/get.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  @override
  void onReady() {
    super.onReady();
    update();
  }
}
