import 'package:flutter/material.dart';
import 'package:smart_campus/data/bean/common/filter_info.dart';

class RegisterState {
  TextEditingController? phoneNumController;
  TextEditingController? studentNumController;
  TextEditingController? passwordController;
  TextEditingController? rePasswordController;
  late List<FilterInfo> filterSchool;
  FilterInfo? curSchool;

  RegisterState() {
    this
      ..studentNumController = TextEditingController()
      ..passwordController = TextEditingController()
      ..phoneNumController = TextEditingController()
      ..rePasswordController = TextEditingController()
      ..filterSchool = [
        FilterInfo(name: '长沙理工大学', tag: '10536'),
      ];
  }
}
