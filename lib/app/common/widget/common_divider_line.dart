import 'package:flutter/material.dart';

class CommonDividerLine extends StatelessWidget {
  final EdgeInsets? padding;

  final double? height;

  const CommonDividerLine({Key? key, this.padding, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Divider(height: height != null ? height! : 1),
    );
  }
}
