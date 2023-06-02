import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'message_detail_state.dart';

class MessageDetailLogic extends GetxController {
  final MessageDetailState state = MessageDetailState();

  @override
  void onReady() async {
    super.onReady();
    SmartDialog.showLoading();
    Timer(const Duration(seconds: 1), () => SmartDialog.dismiss());
    state.configData();
    update();
  }
}
