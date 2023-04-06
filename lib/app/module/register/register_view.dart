import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/config/images/image_common.dart';

import 'register_logic.dart';

class RegisterPage extends StatelessWidget {
  final logic = Get.put(RegisterLogic());
  final state = Get.find<RegisterLogic>().state;

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterLogic>(builder: (logic) {
      return _buildBg(logic, children: [
        _buildTitle(),
        _buildLogo(),
        _buildPhoneNumber(),
        _buildStudentNum(),
        _buildPassWord(),
        _buildRePassWord(),
        _buildRegisteredBtn(),
      ]);
    });
  }

  Widget _buildTitle() {
    return Container(
      margin: const EdgeInsets.only(
        top: 50,
        left: 20,
      ),
      child: const Text(
        '智慧校园平台',
        style: TextStyle(
          color: Colors.black,
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 192,
      height: 192,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter:
              ColorFilter.mode(Colors.transparent, BlendMode.colorBurn),
          image: AssetImage(ImageCommon.login_logo),
        ),
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              '账号:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              controller: state.phoneNumController,
              decoration: const InputDecoration(
                hintText: '请输入手机号',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPassWord() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              '密码:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: state.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: '请输入密码',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisteredBtn() {
    return GestureDetector(
      onTap: () => logic.onRegistred(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          '注册',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildBg(RegisterLogic logic, {required List<Widget> children}) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBindWidget(
        bind: logic,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...children,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStudentNum() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              '学号:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              controller: state.studentNumController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: '请输入学号',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRePassWord() {
    return Container(
      padding: const EdgeInsets.only(left: 5, top: 10,bottom: 10,right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              '重复密码:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: state.studentNumController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: '请重新输入密码',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
