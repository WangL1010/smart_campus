import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/config/images/image_common.dart';

import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  final logic = Get.put(SplashLogic());

  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBindWidget(
      bind: logic,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter:
                ColorFilter.mode(Colors.transparent, BlendMode.colorBurn),
            image: AssetImage(ImageCommon.splash),
          ),
        ),
      ),
    );
  }
}
