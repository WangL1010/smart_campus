import 'package:flutter/material.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/config/images/image_common.dart';
import 'package:smart_campus/data/bean/message/topic_card_bean.dart';

class TopicDetailCard extends StatelessWidget {
  TopicDetailCard({Key? key, this.data}) : super(key: key);

  final TopicCardBean? data;

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: [
      _buildTitle(),
      _buildContent(),
      _buildGood(),
    ]);
  }

  Widget _buildBg({required List<Widget> children}) {
    return GestureDetector(
      onTap: () {
        //todo
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonImage(
                  ImageCommon.schedule,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '昵称',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 250,
            child: Text(
              '话题标题',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.cyan,
        ),
      ),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '话题内容预览',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: 300,
            height: 1,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(2)),
          ),
          Container(
            width: 250,
            child: Text(
              '这是话题的预览内容，asdadadad可能只显示前几句话。',
              style: TextStyle(fontSize: 13),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Container(
                  child: CommonImage(
                    ImageCommon.loop_image_2,
                    width: 70,
                    height: 60,
                  ),
                  margin: EdgeInsets.all(5),
                ),
                Container(
                  child: CommonImage(
                    ImageCommon.loop_image_2,
                    width: 70,
                    height: 60,
                  ),
                  margin: EdgeInsets.all(5),
                ),
                Container(
                  child: CommonImage(
                    ImageCommon.loop_image_2,
                    width: 70,
                    height: 60,
                  ),
                  margin: EdgeInsets.all(5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGood() {
    return GestureDetector(
      onTap: () {
        //todo
      },
      child: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '点赞数',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              width: 10,
            ),
            CommonImage(
              ImageCommon.good,
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
