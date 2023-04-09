import 'package:get/get.dart';
import 'package:smart_campus/app/common/utils/common_toast.dart';

class ToastUtil{

  ToastUtil._();

  static void showToast(String content) {
    CommonToast.showToast(
      content,
      Get.context!,
    );
  }
}