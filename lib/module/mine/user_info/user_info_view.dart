import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/input/input_text.dart';
import 'package:smart_campus/app/common/text/text_style.dart';

import '../../../app/common/bind_widget/get_bind_widget.dart';
import '../../../app/common/widget/common_text_app_bar.dart';
import 'user_info_logic.dart';

class UserInfoPage extends StatelessWidget {
  final logic = Get.put(UserInfoLogic());
  final state = Get.find<UserInfoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserInfoLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildName(),
        _buildPhone(),
        _buildStudentID(),
        _buildSchool(),
        _buildBtn(),
      ]);
    });
  }

  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
        bind: logic,
        child: CommonTextAppBar(
          title: '个人信息',
          body: Column(
            children: [
              ...children,
            ],
          ),
        ));
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
  Widget _buildPhone() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '电话号码',
            style: CommonTextStyle.blackFont18,
          ),
          InputText(
            controller: state.phoneController,
          ),
        ],
      ),
    );
  }
  Widget _buildStudentID() {
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
            controller: state.studentIdController,
          ),
        ],
      ),
    );

  }
  Widget _buildSchool() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '学校',
            style: CommonTextStyle.blackFont18,
          ),
          InputText(
            controller: state.schoolController,
            banEdit: true,
          ),
        ],
      ),
    );
  }
  Widget _buildBtn(){
    return GestureDetector(
      onTap: ()=>logic.submit(),
      child: Container(
        margin: EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text('提交',style: CommonTextStyle.whiteFont20,),
      ),
    );
  }
}
