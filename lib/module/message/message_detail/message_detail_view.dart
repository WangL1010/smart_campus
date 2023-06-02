import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/text/text_style.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/config/images/image_common.dart';

import '../../../app/common/bind_widget/get_bind_widget.dart';
import '../../../app/common/widget/common_text_app_bar.dart';
import 'message_detail_logic.dart';

class MessageDetailPage extends StatelessWidget {
  final logic = Get.put(MessageDetailLogic());
  final state = Get.find<MessageDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageDetailLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildTitle(),
        _buildUserAvatar(),
        _buildContent(),
        _buildGood(),
      ]);
    });
  }
  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      width: double.infinity,
      child: Text(
        state.topicBean.title ?? '',
        style: CommonTextStyle.blackFont24bold,
      ),
    );
  }
  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
        bind: logic,
        child: CommonTextAppBar(
          title: '话题详情',
          body: Column(
            children: [
              ...children,
            ],
          ),
        ));
  }

  Widget _buildUserAvatar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonImage(
            state.topicBean.userAvatar??'',
            width: 30,
            height: 30,
          ),
          SizedBox(width: 5,),
          Text(state.topicBean.userNickname??'',style: CommonTextStyle.blackFont12bold,),
          SizedBox(width: 5,),
        ],
      ),
    );
  }

  Widget _buildContent() {
    List<Widget> images=[];
    state.topicBean.imageList?.forEach((element) =>images.add(Container(
      child: CommonImage(
        element,
        width: 90,
        height: 90,
      ),
      margin: EdgeInsets.all(5),
    ),));
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(state.topicBean.content??'',style: CommonTextStyle.blackFont18,),
          SizedBox(height: 10,),
          Text('#${state.topicBean.typeName??''}',style: CommonTextStyle.blueFont18Bold,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...images,
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildGood() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '点赞数 ',
            style: TextStyle(fontSize: 15),
          ),
          Text(
            '${state.topicBean.likeCount??0}',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            width: 10,
          ),
          CommonImage(
            (state.topicBean.isLike??false)?ImageCommon.good_activity:ImageCommon.good,
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}
