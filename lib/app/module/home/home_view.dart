import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/common/widget/image_overlay.dart';
import 'package:smart_campus/app/config/images/image_common.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildTitleImage(),
        //_buildSwiperWidget(),
      ]);
    });
  }

  Widget _buildTitleImage() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildImageItem(title: '课表', image: ImageCommon.schedule),
          _buildImageItem(title: '通知', image: ImageCommon.notice),
          _buildImageItem(title: '社团活动', image: ImageCommon.activity),
          _buildImageItem(title: '比赛信息', image: ImageCommon.race),
        ],
      ),
    );
  }

  Widget _buildImageItem({required String title, required String image}) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CommonImage(
              image,
              width: 30,
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBg({required List<Widget> children}) {
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
        body: Column(
          children: [
            ...children,
          ],
        ),
      ),
    );
  }

  // Widget _buildSwiperWidget() {
  //   return Container(
  //     height: 250,
  //     width: double.infinity,
  //    // child: Swiper(itemCount: ,pagination: const SwiperPagination(),),
  //   );
  // }
}
