import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/common/function/function.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/common/widget/image_overlay.dart';
import 'package:smart_campus/app/config/colors/colors.dart';
import 'package:smart_campus/app/config/images/image_common.dart';
import 'package:smart_campus/module/home/home_state.dart';
import 'package:smart_campus/module/home/widget/news_detail_card.dart';

import 'home_logic.dart';

List<String> path = [
  ImageCommon.loop_image_1,
  ImageCommon.loop_image_2,
  ImageCommon.loop_image_3,
  ImageCommon.loop_image_4,
];

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(builder: (logic) {
      return _buildBg(context, children: [
        _buildTitleImage(),
        //轮播图
        _buildSwiperWidget(context),
        _buildNewsList(),
      ]);
    });
  }

  Widget _buildTitleImage() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildImageItem(
            title: '课表',
            image: ImageCommon.schedule,
            onTap: () => logic.onSchedule(),
          ),
          _buildImageItem(
            title: '通知',
            image: ImageCommon.notice,
            onTap: () => logic.onNotify(),
          ),
          _buildImageItem(
            title: '社团活动',
            image: ImageCommon.activity,
            onTap: () => logic.onClubActivity(),
          ),
          _buildImageItem(
            title: '比赛信息',
            image: ImageCommon.race,
            onTap: () => logic.onGameInfo(),
          ),
        ],
      ),
    );
  }

  Widget _buildImageItem(
      {required String title,
      required String image,
      ParamVoidCallback? onTap}) {
    return GestureDetector(
      onTap: () => onTap?.call(),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildSwiperWidget(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Align(
          alignment: Alignment.topCenter,
          child: Swiper(
            itemHeight: 160,
            itemWidth: 350,
            itemCount: path.length,
            scrollDirection: Axis.horizontal,
            duration: 1200,
            loop: true,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: CommonImage(
                        path[index],
                        width: 300,
                        height: 140,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 120,
                    child: Container(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: index == 0 ? Colors.blue : Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: index == 1 ? Colors.blue : Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: index == 2 ? Colors.blue : Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: index == 3 ? Colors.blue : Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            layout: SwiperLayout.STACK,
          ),
        ),
      ),
    );
  }

  Widget _buildNewsList() {
    return Expanded(
      child: EasyRefresh(
        firstRefresh: false,
        enableControlFinishRefresh: true,
        enableControlFinishLoad: true,
        controller: state.refreshController,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onLoad: () async => logic.onLoad(),
        child: Column(
          children: List.generate(
            state.showNews.length,
            (index) => NewsDetailCard(
              onTap: (data)=>logic.toDetail(data),
              newsDetail: state.showNews[index],
            ),
          ),
        ),
      ),
    );
  }
}
