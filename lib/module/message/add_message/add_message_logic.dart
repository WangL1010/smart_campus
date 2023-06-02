import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:smart_campus/data/bean/common/filter_info.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../../app/common/dialog/full/full_dialog.dart';
import 'add_message_state.dart';

class AddMessageLogic extends GetxController {
  final AddMessageState state = AddMessageState();

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  Future<void> addPhoto() async {
    final List<AssetEntity>? result =
        await AssetPicker.pickAssets(Get.context!);
    state.result?.addAll(result!);
    update();
  }

  void onBiaoQian(FilterInfo data) {
    state.curType = data;
    update();
  }

 Future<void>  submit() async {
   var isSubmit = await FullDialog.showConfirm(
     context: Get.context!,
     title: '提示',
     content: '请确认是否要提交！',
   );
   if (!isSubmit) {
     return;
   }
   SmartDialog.showLoading();
   Timer(const Duration(seconds: 2), () => SmartDialog.dismiss());
   Get.back();
 }
}
