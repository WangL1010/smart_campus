import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/config/images/image_common.dart';

import 'login_logic.dart';

///SaasAPP登录界面
class LoginPage extends StatelessWidget {
  final logic = Get.put(LoginLogic());
  final state = Get.find<LoginLogic>().state;

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginLogic>(builder: (logic) {
      return _buildBg(logic, children: [
        _buildTitle(),
        _buildLogo(),
        _buildNumber(),
        _buildPassWord(),
        _buildLoginBtn(),
        _buildSignUp(),
      ]);
    });
  }

  /// 登录页根节点布局
  Widget _buildBg(var logic, {required List<Widget> children}) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBindWidget(
        bind: logic,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: const EdgeInsets.only(
        top: 100,
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
      margin: const EdgeInsets.only(
        left: 85,
      ),
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

  Widget _buildNumber() {
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
                fontSize: 20,
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
                fontSize: 20,
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

  Widget _buildLoginBtn() {
    return GestureDetector(
      onTap: () =>logic.onLogin(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          '登录',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUp() {
    return GestureDetector(
      onTap: () =>logic.onSignUp(),
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        child: const Text(
          '注册新账号',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
