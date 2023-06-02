import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/widget/common_divider_line.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/config/images/image_common.dart';

import '../../../../app/common/bind_widget/get_bind_widget.dart';
import '../../../../app/common/text/text_style.dart';
import '../../../../app/common/widget/common_text_app_bar.dart';
import 'activity_detail_logic.dart';

class ActivityDetailPage extends StatelessWidget {
  final logic = Get.put(ActivityDetailLogic());
  final state = Get.find<ActivityDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActivityDetailLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildTitle(),
        _buildName(),
        _buildPlace(),
        _buildNumber(),
        _buildContent(),
        _buildBtn(),
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
            '俱乐部：',
            style: CommonTextStyle.blackFont18,
          ),
          Spacer(),
          Text(
            state.data.clubName??'',
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
            state.data.activityPlace??'',
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
            '人数：',
            style: CommonTextStyle.blackFont18,
          ),
          Spacer(),
          Text(
            '${state.data.activityCapacity??0}',
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
          title: '活动详情',
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
          CommonImage(ImageCommon.activity_icon,width: 50,height: 50,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('活动时间：  ${state.data.activityTime}',style: CommonTextStyle.blackFont18,),
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
          Text(state.data.activityContent??'',style: CommonTextStyle.blackFont18,),
        ],
      ),
    );
  }

  Widget _buildBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: ()=>logic.join(),
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:state.data.isJoin==1? Colors.grey:Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text('报名',style: CommonTextStyle.whiteFont20,),
          ),
        ),
      ],
    );
  }
}
