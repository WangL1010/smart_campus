import 'package:smart_campus/data/bean/user/user_info_manager.dart';

import '../../data/bean/user/user_bean.dart';

class MineState {
  late UserBean user;

  MineState() {
    user = UserInfoManager.instance.loginUserBean!;
  }
}
