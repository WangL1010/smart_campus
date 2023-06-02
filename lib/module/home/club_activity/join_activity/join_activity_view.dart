import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/common/bind_widget/get_bind_widget.dart';
import '../../../../app/common/input/input_text.dart';
import '../../../../app/common/text/text_style.dart';
import '../../../../app/common/widget/common_text_app_bar.dart';
import 'join_activity_logic.dart';

class JoinActivityPage extends StatelessWidget {
  final logic = Get.put(JoinActivityLogic());
  final state = Get.find<JoinActivityLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JoinActivityLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildTitle(),
        _buildName(),
        _buildId(),
        _buildBtn(),
      ]);
    });
  }
  Widget _buildBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: ()=>logic.submit(),
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text('提交',style: CommonTextStyle.whiteFont20,),
          ),
        ),
      ],
    );
  }
  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '请输入信息',
            style: CommonTextStyle.blueFont18Bold,
          ),

        ],
      ),
    );
  }
  Widget _buildName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '名字',
            style: CommonTextStyle.blackFont18,
          ),
          InputText(
            controller: state.nameController,
          ),
        ],
      ),
    );
  }
  Widget _buildId() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '学号',
            style: CommonTextStyle.blackFont18,
          ),
          InputText(
            controller: state.IdController,
          ),
        ],
      ),
    );
  }
  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
        bind: logic,
        child: CommonTextAppBar(
          title: '社团活动',
          body: Column(
            children: [
              ...children,
            ],
          ),
        ));
  }

}
