import 'package:flutter/material.dart';
import 'package:smart_campus/app/common/function/function.dart';
import 'package:smart_campus/app/common/widget/common_divider_line.dart';
import 'package:smart_campus/data/bean/home/notification_bean.dart';

class NoticeDetailCardWidget extends StatelessWidget {
  const NoticeDetailCardWidget({Key? key, required this.data, required this.onTap})
      : super(key: key);
  final NotificationBean data;
  final ParamSingleCallback<NotificationBean> onTap;

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: [
      _buildTitle(),
      CommonDividerLine(
        height: 2,
      ),
      _buildContent(),
    ]);
  }

  Widget _buildBg({required List<Widget> children}) {
    return GestureDetector(
      onTap: ()=>onTap.call(data),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color:(data.isRead??false)? Colors.red:Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              (data.isRead??false)?'已读':'未读',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          const Spacer(),
          Text(
            data.title??'',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  '单位:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  data.unit??'',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '内容:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text(
                    data.content??'',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              data.time??'',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
