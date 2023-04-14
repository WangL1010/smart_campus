import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/config/colors/colors.dart';
import 'package:smart_campus/app/config/images/image_common.dart';

import 'mine_logic.dart';

class MinePage extends StatelessWidget {
  final logic = Get.put(MineLogic());
  final state = Get.find<MineLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildMineInfo(),
        _buildMyPublish(),
        _buildBack(),
      ]);
    });
  }

  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
      bind: logic,
      child: Scaffold(
        backgroundColor: CommonTextColor.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text(
            '个人中心',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildMineInfo() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonImage(
              ImageCommon.loop_image_2,
              width: 60,
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                //todo
              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 230,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Text('昵称:  小王'),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Text('学号:  201908010433'),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Text('学院:  计算机与通信工程'),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    CommonImage(
                      ImageCommon.right,
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyPublish() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          CommonImage(
            ImageCommon.publish,
            width: 40,
            height: 40,
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              width: 270,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      '我的发布',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  CommonImage(
                    ImageCommon.right,
                    width: 15,
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBack() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          CommonImage(
            ImageCommon.back,
            width: 40,
            height: 40,
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              width: 270,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      '退出登录',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  CommonImage(
                    ImageCommon.right,
                    width: 15,
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
