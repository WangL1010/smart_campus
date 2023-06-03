import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/common/bind_widget/get_bind_widget.dart';
import '../../../../app/common/input/input_text.dart';
import '../../../../app/common/text/text_style.dart';
import '../../../../app/common/widget/common_text_app_bar.dart';
import '../../../../data/bean/common/filter_info.dart';
import 'add_activity_logic.dart';

class AddActivityPage extends StatelessWidget {
  final logic = Get.put(AddActivityLogic());
  final state = Get.find<AddActivityLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddActivityLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildTitle(),
        _buildClub(),
        _buildTime(),
        _buildContent(),
        _buildBtn(),
      ]);
    });
  }
  Widget _buildBtn(){
    return GestureDetector(
      onTap: ()=>logic.submit(),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text('发布',style: CommonTextStyle.whiteFont20,),
      ),
    );
  }
  Widget _buildClub() {
    List<Widget> widgets=[];
    widgets.add(Text('请选择社团：',style: CommonTextStyle.blackFont18,));
    for(FilterInfo data in state.filterType){
      widgets.add(_buildItem(data));
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...widgets,
          ],
        ),
      ),
    );
  }
  Widget _buildItem(FilterInfo data){
    return GestureDetector(
      onTap: ()=>logic.onClub(data),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: data==state.curType?Colors.blue:Colors.grey,),
        ),
        child: Text(
          data.name,
          style: data==state.curType?CommonTextStyle.blueFont18Bold:CommonTextStyle.blackFont18,
        ),
      ),
    );
  }
  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '活动地点:',
            style: CommonTextStyle.blackFont18,
          ),
          Container(
              width: 200,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: InputText(
                controller: state.placeController,
              )),
        ],
      ),
    );
  }
  Widget _buildTime() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '活动时间:',
            style: CommonTextStyle.blackFont18,
          ),
          Container(
              width: 200,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: InputText(
                controller: state.activityTimeController,
              )),
        ],
      ),
    );
  }
  Widget _buildContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '活动描述:',
            style: CommonTextStyle.blackFont18,
          ),
          Container(
              width: 250,
              height: 200,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              alignment: Alignment.topLeft,
              child: InputText(
                controller: state.contentController,
              )),
        ],
      ),
    );
  }
  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
        bind: logic,
        child: CommonTextAppBar(
          title: '发布活动',
          body: Column(
            children: [
              ...children,
            ],
          ),
        ));
  }
}
