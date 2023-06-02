import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/input/input_text.dart';
import 'package:smart_campus/app/common/text/text_style.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/config/images/image_common.dart';
import 'package:smart_campus/data/bean/common/filter_info.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../../app/common/bind_widget/get_bind_widget.dart';
import '../../../app/common/widget/common_text_app_bar.dart';
import 'add_message_logic.dart';

class AddMessagePage extends StatelessWidget {
  final logic = Get.put(AddMessageLogic());
  final state = Get.find<AddMessageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMessageLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildTitle(),
        _buildContent(),
        _buildPhoto(),
        _buildBIaoqia(),
        _buildBtn(),
      ]);
    });
  }

  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
        bind: logic,
        child: CommonTextAppBar(
          title: '发布话题',
          body: SingleChildScrollView(
            child: Column(
              children: [
                ...children,
              ],
            ),
          ),
        ));
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '标题:',
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
                controller: state.titleController,
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
            '内容:',
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

  Widget _buildPhoto() {
    List<Widget> widgets = [];
    for (AssetEntity data in state.result ?? []) {
      widgets.add(Image(
        image: AssetEntityImageProvider(
          data,
          isOriginal: false,
        ),
        width: 100,
        height: 100,
      ));
    }
    widgets.add(GestureDetector(
        onTap: () => logic.addPhoto(),
        child: CommonImage(
          ImageCommon.add_photo,
          width: 100,
          height: 100,
        )));
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Wrap(
        children: [
          ...widgets,
        ],
      )
    );
  }

  Widget _buildBIaoqia() {
    List<Widget> widgets=[];
    widgets.add(Text('请选择标签：',style: CommonTextStyle.blackFont18,));
    for(FilterInfo data in state.filterType){
      widgets.add(_buildItem(data));
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          ...widgets,
        ],
      ),
    );
  }
  Widget _buildItem(FilterInfo data){
    return GestureDetector(
      onTap: ()=>logic.onBiaoQian(data),
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
        child: Text('提交',style: CommonTextStyle.whiteFont20,),
      ),
    );
  }
}
