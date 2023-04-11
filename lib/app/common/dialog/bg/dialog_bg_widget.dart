import 'package:flutter/material.dart';

///绘制整体背景动画
///处理黑色背景渐入和渐失
typedef DialogParamVoidCallback = dynamic Function();

class DialogBgWidget extends StatefulWidget {
  DialogBgWidget({
    this.child,
    this.offsetLT,
    this.offsetRB,
    this.duration = const Duration(milliseconds: 300),
    this.cancelable = true,
    this.darkEnable = true,
    this.highlights,
    required this.onDismiss,
  });

  ///子控件
  final Widget? child;

  ///高亮背景偏移量
  final Offset? offsetLT, offsetRB;

  ///背景渐入渐出事件
  final Duration duration;

  ///能否被取消
  final bool cancelable;

  ///是否显示黑色
  final bool darkEnable;

  ///高亮多个区域
  final List<RRect>? highlights;

  ///结局自定义布局动画的地方必须加在该回调内
  ///点击非自定义控件区域和返回区域都会回调该处, 说明需要弹窗该弹窗栈
  final DialogParamVoidCallback onDismiss;

  @override
  __DialogBgWidgetState createState() => __DialogBgWidgetState();
}

class __DialogBgWidgetState extends State<DialogBgWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> alphaAnim;
  late AnimationController alphaController;
  List<RRect> _highlights = [];

  @override
  void initState() {
    super.initState();
    highlights = widget.highlights ?? [];
    alphaController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    alphaAnim = Tween<double>(begin: 0, end: 127).animate(alphaController);
    alphaController.forward();
  }

  dismiss() {
    alphaController.reverse();
    widget.onDismiss();
  }

  set highlights(List<RRect> value) {
    setState(() {
      _highlights = value;
    });
  }

  @override
  void dispose() {
    alphaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.cancelable) {
          dismiss();
          return true;
        }
        return false;
      },
      child: GestureDetector(
        onTap: () {
          if (widget.cancelable) {
            dismiss();
          }
        },
        child: Stack(
          children: <Widget>[
            widget.darkEnable ? buildDarkBg() : Container(),
            widget.child ?? Container(),
          ],
        ),
      ),
    );
  }

  Widget buildDarkBg() {
    return AnimatedBuilder(
      animation: alphaController,
      builder: (_, __) {
        return Padding(
          padding: EdgeInsets.only(
            left: widget.offsetLT?.dx ?? 0,
            top: widget.offsetLT?.dy ?? 0,
            right: widget.offsetRB?.dx ?? 0,
            bottom: widget.offsetRB?.dy ?? 0,
          ),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withAlpha(alphaAnim.value.toInt()),
              BlendMode.srcOut,
            ),
            child: Stack(
              children: _buildDark(),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildDark() {
    List<Widget> widgets = [];
    widgets.add(Container(
      decoration: BoxDecoration(
        color: Colors.white,
        backgroundBlendMode: BlendMode.dstOut,
      ),
    ));
    for (RRect highlight in _highlights) {
      widgets.add(Positioned(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: highlight.tlRadius,
                topRight: highlight.trRadius,
                bottomLeft: highlight.blRadius,
                bottomRight: highlight.brRadius,
              )),
          width: highlight.width,
          height: highlight.height,
        ),
        left: highlight.left,
        top: highlight.top,
      ));
    }
    return widgets;
  }
}
