import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/common/input/input_text.dart';
import 'package:smart_campus/app/common/text/text_style.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/common/widget/image_overlay.dart';
import 'package:smart_campus/app/config/colors/colors.dart';
import 'package:smart_campus/app/config/images/image_common.dart';
import 'package:smart_campus/module/message/widget/topic_detail_card.dart';
import 'message_logic.dart';

class MessagePage extends StatelessWidget {
  final logic = Get.put(MessageLogic());
  final state = Get.find<MessageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageLogic>(builder: (logic) {
      return _buildBg(context, children: [
        TopicDetailCard(),
        TopicDetailCard(),
        TopicDetailCard(),
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
        backgroundColor: CommonTextColor.backgroundColor,
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
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text(
                            '学习',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          CommonImage(
                            ImageCommon.down,
                            width: 10,
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          InputText(
                            hintText: '请输入',
                          ),
                          GestureDetector(
                            onTap: () {
                              //todo
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue,
                              ),
                              padding: EdgeInsets.all(4),
                              child: Text(
                                '搜索',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonImage(ImageCommon.add, width: 20, height: 20),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '发布话题',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Container(
                color: CommonTextColor.backgroundColor,
                child: Column(
                  children: [
                    ...children,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
