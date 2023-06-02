import 'package:get/get.dart';
import 'package:smart_campus/data/bean/home/news_detail_bean.dart';

class NewsDetailState {
  static String keyData = 'keyData';
  late NewsDetailBean detailBean;

  NewsDetailState() {
    detailBean=NewsDetailBean();
  }

  void configData() {
    var arguments = Get.arguments;
    if (arguments == null) {
      return;
    }
    detailBean = arguments[keyData];
  }
}
