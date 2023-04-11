import 'package:flutter/material.dart';

class LoginState {
  TextEditingController? phoneNumController;
  TextEditingController? passwordController;


  LoginState() {
    this
      ..phoneNumController = TextEditingController()
      ..passwordController = TextEditingController();
  }
}
