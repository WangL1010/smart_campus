import 'package:smart_campus/data/bean/user/user_bean.dart';

///用户信息管理类
class UserInfoManager {
  ///用户资料
  UserBean? _loginUserBean;

  static UserInfoManager? _instance;

  UserInfoManager._();

  factory UserInfoManager() => _getInstance();

  static UserInfoManager get instance => _getInstance();

  static UserInfoManager _getInstance() {
    _instance ??= UserInfoManager._();
    return _instance!;
  }

  updateUserInfo(UserBean? loginUserBean) {
    _loginUserBean = loginUserBean;
  }

  ///获取用户信息
  UserBean? get loginUserBean {
    return _loginUserBean;
  }

  get userId => _loginUserBean?.id ?? -1;

  String get userName => _loginUserBean?.name ?? '';

  String get userPhone => _loginUserBean?.name ?? '';

  get schoolId => _loginUserBean?.schoolId ?? -1;

  String get schoolName => _loginUserBean?.schoolName ?? '';

  String get studentId => _loginUserBean?.studentId ?? '';
}
