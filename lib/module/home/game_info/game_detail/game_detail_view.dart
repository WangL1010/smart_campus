import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/common/bind_widget/get_bind_widget.dart';
import '../../../../app/common/text/text_style.dart';
import '../../../../app/common/widget/common_divider_line.dart';
import '../../../../app/common/widget/common_image_widget.dart';
import '../../../../app/common/widget/common_text_app_bar.dart';
import '../../../../app/config/images/image_common.dart';
import 'game_detail_logic.dart';

class GameDetailPage extends StatelessWidget {
  final logic = Get.put(GameDetailLogic());
  final state = Get.find<GameDetailLogic>().state;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameDetailLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildTitle(),
        _buildName(),
        _buildPlace(),
        _buildNumber(),
        _buildTime(),
        _buildContent(),
        // _buildLianjie(),
      ]);
    });
  }
  Widget _buildName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonImage(ImageCommon.home_active,width: 30,height: 30,),
          Text(
            '学院：',
            style: CommonTextStyle.blackFont18,
          ),
          Spacer(),
          Text(
            state.data.relatedCollege??'',
            style: CommonTextStyle.blackFont18,
          ),
        ],
      ),
    );
  }
  Widget _buildPlace() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonImage(ImageCommon.didian,width: 30,height: 30,),
          Text(
            '地点：',
            style: CommonTextStyle.blackFont18,
          ),
          Spacer(),
          Text(
            state.data.location??'',
            style: CommonTextStyle.blackFont18,
          ),
        ],
      ),
    );
  }
  Widget _buildNumber() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonImage(ImageCommon.person,width: 30,height: 30,),
          Text(
            '比赛名称：：',
            style: CommonTextStyle.blackFont18,
          ),
          Spacer(),
          Text(
            '${state.data.competitionName??0}',
            style: CommonTextStyle.blackFont18,
          ),
        ],
      ),
    );
  }

  Widget _buildTime() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonImage(ImageCommon.time,width: 30,height: 30,),
          Text(
            '报名截止时间：',
            style: CommonTextStyle.blackFont18,
          ),
          Spacer(),
          Text(
            '${state.data.registrationDeadline??0}',
            style: CommonTextStyle.blackFont18,
          ),
        ],
      ),
    );
  }
  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
        bind: logic,
        child: CommonTextAppBar(
          title: '比赛详情',
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...children,
            ],
          ),
        ));
  }

  Widget _buildTitle() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonImage(ImageCommon.race,width: 50,height: 50,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('比赛时间：  ${state.data.eventTime}',style: CommonTextStyle.blackFont18,),
              Text('发布时间：  ${state.data.publishTime}',style: CommonTextStyle.blackFont18,),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('活动描述',style: CommonTextStyle.blueFont18Bold,),
          CommonDividerLine(padding: EdgeInsets.symmetric(vertical: 5),height: 2,),
          Text(state.data.eventContent??'',style: CommonTextStyle.blackFont18,),
        ],
      ),
    );
  }

  _buildLianjie() {

      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        margin: EdgeInsets.only(bottom: 5),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '赛事官网链接：',
              style: CommonTextStyle.blackFont18,
            ),
            Spacer(),
            GestureDetector(
              onTap: ()=>logic.toWebView(),
              child: Text(
                'http://www.baidu.com/',
                style: CommonTextStyle.blueFont18Bold,
              ),
            ),
          ],
        ),
      );

  }


}
