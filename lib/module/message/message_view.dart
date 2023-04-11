import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/common/widget/image_overlay.dart';
import 'package:smart_campus/app/config/colors/colors.dart';
import 'package:smart_campus/app/config/images/image_common.dart';

import 'message_logic.dart';

class MessagePage extends StatelessWidget {
  final logic = Get.put(MessageLogic());
  final state = Get.find<MessageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageLogic>(builder: (logic) {
      return _buildBg(context, children: [

      ]);
    });
  }


  Widget _buildBg(
      BuildContext context, {
        required List<Widget> children,
      }) {
    return GetBindWidget(
      bind: logic,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              const ImageOverlay(
                image: AssetImage(ImageCommon.location),
                height: 25,
                width: 25,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  '长沙理工大学',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color:  CommonTextColor.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
