import 'package:common_widget_lib/common_widget_lib.dart';
import 'package:get/get.dart';

class ToastUtil{

  ToastUtil._();

  static void showToast(String content) {
    EhiToast.showToast(
      content,
      Get.context!,
      toastPosition: EhiToastPosition.CENTER,
    );
  }
}