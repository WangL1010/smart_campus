import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'web_view_state.dart';

class InAppWebViewLogic extends GetxController {
  final InAppWebViewState state = InAppWebViewState();

  @override
  void onReady() {
    state.url = Get.arguments[InAppWebViewState.keyUrl] ?? '';
    update();
    super.onReady();
  }

  Future<void> initFinish() async {
    Completer<void> completer = Completer();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete();
    });

    return completer.future;
  }

  // void initController(InAppWebViewController controller) async {
  //   state.controller = controller;
  // }
  void onLoadStop() {
  SmartDialog.dismiss();
  }

  // void onBack() async {
  //   bool canGoBack = await state.controller.canGoBack();
  //   if (canGoBack) {
  //     state.controller.goBack();
  //   } else {
  //     Get.back();
  //   }
  // }

  // Future<bool> get canPop async {
  //   bool canGoBack = await state.controller.canGoBack();
  //   if (canGoBack) {
  //     state.controller.goBack();
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
}
