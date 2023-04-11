import 'package:flutter/material.dart';
import 'package:smart_campus/app/common/dialog/bg/common_element.dart';
import 'package:smart_campus/app/common/dialog/typedef/function.dart';

class TopListDialog extends StatefulWidget {
  TopListDialog({
    Key? key,
    this.data,
    this.onTap,
    this.selectedString,
  }) : super(key: key);

  ///数据源
  final List<String>? data;

  ///被选中的数据
  final String? selectedString;

  ///回调
  final DialogParamSingleCallback<int>? onTap;

  @override
  _TopListDialogState createState() => _TopListDialogState();
}

class _TopListDialogState extends State<TopListDialog>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
        .animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBg(
      child: _buildList(
        itemBuilder: (context, index) {
          return Column(
            children: [
              //item内容
              _buildItemContent(index),

              //分割线
              Container(color: Color(0xFFEEEEEE), height: 1),
            ],
          );
        },
      ),
    );
  }

  Widget _buildItemContent(int index) {
    return InkWell(
      onTap: () {
        _controller.reverse();
        dismiss();
        //回调数据源
        widget.onTap?.call(index);
      },
      child: Container(
        height: 90,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(flex: 1, child: Container()),

            //文字
            Expanded(
              flex: 1,
              child: Center(child: Text('${widget.data?[index]}')),
            ),

            //是否选中
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Visibility(
                  visible: widget.data?[index] == widget.selectedString,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  child: Icon(Icons.check),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBg({Widget? child}) {
    return AppBarLight(
      onDismiss: dismiss,
      child: ClipRect(
        child: SlideTransition(
          position: _animation,
          child: Material(color: Colors.white, child: child),
        ),
      ),
    );
  }

  Widget _buildList({
    required IndexedWidgetBuilder itemBuilder,
  }) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 2 / 5,
      ),
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: widget.data?.length,
        itemBuilder: itemBuilder,
      ),
    );
  }

  dismiss() {
    _controller.reverse();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
