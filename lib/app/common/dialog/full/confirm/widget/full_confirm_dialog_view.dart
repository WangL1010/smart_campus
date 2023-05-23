import 'package:flutter/material.dart';

typedef FullConfirmParamVoidCallback = void Function();

///独立控件,尽量减少依赖
///
///用于提示是否确定自己的选择

class FullConfirmDialogView extends StatefulWidget {
  FullConfirmDialogView({
    Key? key,
    this.titleStyle,
    this.title,
    this.cancel = '取消',
    this.cancelStyle,
    this.confirm = '确认',
    this.confirmStyle,
    this.content,
    this.contentStyle,
    this.onCancel,
    this.onConfirm,
    this.isSingleBtn = false,
    this.customContent,
    this.isNavigator = true,
  });

  ///取消回调
  final FullConfirmParamVoidCallback? onCancel;

  ///确定回调
  final FullConfirmParamVoidCallback? onConfirm;

  ///标题内容
  final String? title;

  ///内容样式
  final TextStyle? titleStyle;

  ///内容信息
  final String? content;

  ///标题样式
  final TextStyle? contentStyle;

  ///标题内容
  final String? cancel;

  ///标题样式
  final TextStyle? cancelStyle;

  ///标题内容
  final String? confirm;

  ///标题样式
  final TextStyle? confirmStyle;

  ///是否使用单按钮
  final bool isSingleBtn;

  ///自定义content内容
  final Widget? customContent;

  ///判断是否需要Navigator；
  final bool? isNavigator;

  @override
  _FullConfirmDialogViewState createState() => _FullConfirmDialogViewState();
}

class _FullConfirmDialogViewState extends State<FullConfirmDialogView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return _buildBg(
      children: [
        //标题
        _buildTitle(),

        //内容
        _buildContent(),

        //确定和取消模块
        _buildClickEvent(context),
      ],
    );
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildClickEvent(BuildContext context) {
    return Column(
      children: [
        //分割线
        Container(
          height: 1,
          width: double.infinity,
          color: Color(0xFFEEEEEE),
        ),

        //确定和取消
        Container(
          height: 50,
          child: Row(
            children: [
              //取消
              widget.isSingleBtn
                  ? Container()
                  : Expanded(child: _buildCancel()),

              //分割线
              widget.isSingleBtn
                  ? Container()
                  : Container(
                      height: double.infinity,
                      width: 1,
                      color: Color(0xFFEEEEEE),
                    ),

              //确定
              Expanded(child: _buildConfirm()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConfirm() {
    return TextButton(
      onPressed: () async {
        ///点击确定的关闭逻辑
        if (widget.onConfirm != null) {
          _dealCloseLogic(widget.onConfirm!);
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(8))
        ),
        child: Text(
          widget.confirm ?? '',
          style: widget.confirmStyle ??
              TextStyle(
                color: const Color(0xFF0299FF),
                fontSize: 20,
              ),
        ),
      ),
    );
    // return FlatButton(
    //   onPressed: () async {
    //     ///点击确定的关闭逻辑
    //     _dealCloseLogic(widget.onConfirm);
    //   },
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       bottomRight: Radius.circular(8.dp),
    //     ),
    //   ),
    //   height: 90.dp,
    //   child: Text(
    //     widget.confirm,
    //     style: widget.confirmStyle ??
    //         TextStyle(
    //           color: Color(0xFF0299FF),
    //           fontSize: 30.sp,
    //         ),
    //   ),
    // );
  }

  Widget _buildCancel() {
    return TextButton(
      onPressed: () async {
        ///点击取消控制逻辑
        if (widget.onCancel != null) {
          _dealCloseLogic(widget.onCancel!);
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(8))
        ),
        child: Text(
          widget.cancel ?? '',
          style: widget.cancelStyle ??
              TextStyle(
                color: const Color(0xFF333333),
                fontSize: 20
              ),
        ),
      ),
    );

  }

  Widget _buildContent() {
    if (widget.customContent != null) {
      return widget.customContent!;
    }
    return widget.title != null
        ? Container(
            padding: EdgeInsets.only(left: 47, right: 47),
            margin: EdgeInsets.only(top: 48, bottom: 48),
            child: Text(
              widget.content ?? '',
              style: widget.contentStyle ??
                  TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 20,
                  ),
            ),
          )
        : Container(
            padding: EdgeInsets.only(left: 47, right: 47),
            margin: EdgeInsets.only(top: 52, bottom: 94),
            child: Text(
              widget.content ?? '',
              style: widget.contentStyle ??
                  TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 20,
                  ),
            ),
          );
  }

  Widget _buildTitle() {
    return Visibility(
      visible: widget.title != null,
      child: Container(
        padding: EdgeInsets.only(left: 47, right: 47),
        child: Text(
          widget.title ?? '',
          style: widget.titleStyle ??
              TextStyle(
                color: Color(0xFF333333),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  ///关于一些背景设置
  Widget _buildBg({required List<Widget> children}) {
    return Center(
      child: ScaleTransition(
        scale: CurvedAnimation(
          parent: _controller,
          curve: Curves.linear,
        ),
        child: Container(
          width: 300,
          padding: EdgeInsets.only(top: 42),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      ),
    );
  }

  void _dealCloseLogic(FullConfirmParamVoidCallback? callBack) async {
    close();
    if (callBack != null) {
      callBack();
    }
  }

  void close() {
    _controller.reverse();
    if (widget.isNavigator ?? true) {
      Navigator.pop(context);
    }
  }
}
