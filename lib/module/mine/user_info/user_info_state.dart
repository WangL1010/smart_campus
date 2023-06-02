import 'package:flutter/material.dart';

import '../../../data/bean/user/user_bean.dart';
import '../../../data/bean/user/user_info_manager.dart';

class UserInfoState {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController studentIdController;
  late TextEditingController schoolController;
  late UserBean user;
  UserInfoState() {
    user = UserInfoManager.instance.loginUserBean!;
    nameController=TextEditingController(text: user.name);
    phoneController=TextEditingController(text: user.userphone);
    studentIdController=TextEditingController(text: user.studentId);
    schoolController=TextEditingController(text: user.schoolName);
  }

}
