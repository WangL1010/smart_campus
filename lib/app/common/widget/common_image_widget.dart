import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CommonImageWidget {
  CommonImageWidget._();

  static Widget loadImg(String path,
      {BoxFit fit = BoxFit.fill, double? width, double? height}) {
    if (path.isEmpty) {
      // 这里放默认图片
      return Image.asset('', fit: fit, width: width, height: height);
    }
    if (path.startsWith('http')) {
      return ExtendedImage.network(
        path,
        fit: fit,
        width: width,
        height: height,
        cache: true,
        shape: BoxShape.rectangle,
        // cancelToken: cancelToken,
      );
    }
    if (path.startsWith('assets')) {
      return Image.asset(path, fit: fit, width: width, height: height);
    }
    return Image.file(File(path), fit: fit, width: width, height: height);
  }
}

class CommonImage extends StatelessWidget {
   CommonImage(
    this.path, {
    Key? key,
    this.fit = BoxFit.fill,
    this.width,
    this.height,
    this.margin,
  }) : super(key: key);

  final String path;
  final BoxFit fit;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: _buildImage(),
    );
  }

  Widget _buildImage() {
    if (path.isEmpty) {
      return Container(height: height, width: width, color: Colors.transparent);
    }
    if (path.startsWith('http')) {
      return ExtendedImage.network(
        path,
        fit: fit,
        width: width,
        height: height,
        cache: true,
        shape: BoxShape.rectangle,
        // cancelToken: cancelToken,
      );
    }
    if (path.startsWith('assets')) {
      return Image.asset(path, fit: fit, width: width, height: height);
    }
    return Image.file(File(path), fit: fit, width: width, height: height);
  }
}
