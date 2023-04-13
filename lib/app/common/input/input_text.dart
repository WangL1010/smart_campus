import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


///输入控件封装，封装模块尽量减少依赖，方便移植
typedef InputParamSingleCallback<D> = dynamic Function(D data);
typedef InputParamVoidCallback = dynamic Function();

class InputText extends StatefulWidget {
  const InputText({Key? key,
    this.inputFormatters,
    this.hintText = '请输入',
    this.hintColor = const Color(0xFFCCCCCC),
    this.hintSize,
    this.textColor = const Color(0xFF333333),
    this.textSize,
    this.keyboardType,
    this.autofocus,
    this.onChanged,
    this.controller,
    this.textAlign = TextAlign.start,
    this.width,
    this.height,
    this.onComplete,
    this.onLoseFocus,
    this.onGetFocus,
    this.maxLength,
    this.style,
    this.decoration,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.onIosNumFinish,
    this.enabled,
    this.focusNode,
    this.banEdit = false,
    this.isAutoClose = true,
    this.expands = false,
    this.autoDispose = true,
    this.counterBuilder,
  }) : super(key: key);

  ///自动回收资源，默认false；如果需要做跨页面，可将其设置为true
  final bool autoDispose;

  ///禁止编辑,默认false(不禁止)
  final bool banEdit;

  final double? height;
  final double? width;

  ///点击其他区域 是否自动关闭键盘
  final bool isAutoClose;

  ///文字与提示是否撑满控件
  final bool expands;

  ///限制输入条件
  final List<TextInputFormatter>? inputFormatters;

  ///提示文字、样式颜色、大小
  final String hintText;
  final Color? hintColor;
  final double? hintSize;

  ///显示文字颜色、大小
  final Color textColor;
  final double? textSize;

  ///唤起不同的键盘类型
  final TextInputType? keyboardType;

  ///是否自动聚焦焦点
  final bool? autofocus;

  ///回调输入的数据
  final InputParamSingleCallback<String>? onChanged;

  ///输入完成回调
  final InputParamVoidCallback? onComplete;

  ///控制器
  final TextEditingController? controller;

  ///文字展示方形
  final TextAlign textAlign;

  ///失去焦点
  final InputParamVoidCallback? onLoseFocus;

  ///获取焦点
  final InputParamVoidCallback? onGetFocus;

  ///点击输入框
  final InputParamVoidCallback? onTap;

  ///最大行数
  final int? maxLines;

  /// 最小行数
  final int? minLines;

  ///编辑的字体样式
  final TextStyle? style;

  ///最大长度
  final int? maxLength;

  ///装饰类
  final InputDecoration? decoration;

  ///ios 数字键盘完成
  final InputParamVoidCallback? onIosNumFinish;

  ///是否禁止输入
  final bool? enabled;

  ///焦点
  final FocusNode? focusNode;

  ///自定义字符计数器
  final InputCounterWidgetBuilder? counterBuilder;

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    //监听焦点获得和失去
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && widget.onGetFocus != null) {
        widget.onGetFocus!();
      } else if (!_focusNode.hasFocus && widget.onLoseFocus != null) {
        widget.onLoseFocus!();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.width != null && widget.width == 0)
        ? _inputText(context)
        : Container(
            height: widget.height ?? 20,
            width: widget.width ?? 130,
            alignment: Alignment.center,
            child: _inputText(context),
          );
  }

  Widget _inputText(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.banEdit,
        child: TextField(
          focusNode: _focusNode,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          autofocus: widget.autofocus ?? false,
          textAlign: widget.textAlign,
          expands: widget.expands,
          style: widget.style ??
              TextStyle(
                color: widget.textColor,
                fontSize: widget.textSize ?? 20,
              ),
          enabled: widget.enabled,
          inputFormatters: widget.inputFormatters,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          decoration: widget.decoration ??
              InputDecoration(
                ///较小空间时，使组件正常渲染，包括文本垂直居中
                isDense: true,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: widget.hintColor,
                  fontSize: widget.hintSize ?? 17,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(0.0),
              ),
          onChanged: (msg) => widget.onChanged?.call(msg),
          onEditingComplete:()=> widget.onComplete?.call(),
          buildCounter: widget.counterBuilder,
          onTap: () => widget.onTap?.call(),
        ),
      );

  }

  @override
  void dispose() {
    _focusNode.dispose();
    // if (widget.autoDispose) widget.controller?.dispose();

    super.dispose();
  }
}
