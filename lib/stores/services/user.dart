import 'dart:convert';

import 'package:cloudmusic/models/user_info.dart';
import 'package:cloudmusic/tools/storage.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  static const tokenKey = 'auth_token';
  static const userInfoKey = 'user_info';

  // 是否已登陆
  final _isLogin = false.obs;
  bool get isLogin => _isLogin.value;

  // api token
  String token = '';
  bool get hasToken => token.isNotEmpty;

  // 用户信息
  final _userInfo = Rx<UserInfo?>(null);
  UserInfo? get userInfo => _userInfo.value;

  @override
  void onInit() {
    super.onInit();

    token = Storage.to.getString(tokenKey);
    var userInfoStr = Storage.to.getString(userInfoKey);
    if (userInfoStr.isNotEmpty) {
      _userInfo(UserInfo.fromJson(jsonDecode(userInfoStr)));
    }
  }
}
