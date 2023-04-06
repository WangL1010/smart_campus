import 'package:flutter/material.dart';

class RegisterState {
  TextEditingController? phoneNumController;
  TextEditingController? studentNumController;
  TextEditingController? passwordController;
  TextEditingController? rePasswordController;

  RegisterState() {
    this
      ..studentNumController = TextEditingController()
      ..passwordController = TextEditingController()
      ..phoneNumController = TextEditingController()
      ..rePasswordController = TextEditingController();
  }
}
