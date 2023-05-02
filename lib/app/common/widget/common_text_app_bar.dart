import 'package:flutter/material.dart';
import 'package:smart_campus/app/config/colors/colors.dart';

class CommonTextAppBar extends StatelessWidget {
  const CommonTextAppBar({
    Key? key,
    this.backgroundColor,
    this.automaticallyImplyLeading,
    required this.title,
    this.titleStyle,
    required this.body,
  }) : super(key: key);

  final Color? backgroundColor;
  final bool? automaticallyImplyLeading;
  final String title;
  final TextStyle? titleStyle;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? CommonTextColor.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading ?? true,
        elevation: 0,
        title: Text(
          title,
          style: titleStyle ??
              const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
        ),
        centerTitle: true,
      ),
      body: body,
    );
  }
}
