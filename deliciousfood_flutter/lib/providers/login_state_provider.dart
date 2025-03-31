import 'package:deliciousfood_flutter/common/network/base/client.dart';
import 'package:deliciousfood_flutter/common/network/extension/user_client.dart';
import 'package:deliciousfood_flutter/models/mine/login_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStateProvider extends ChangeNotifier {
  bool isLoggedIn = false;
  Future<void> getLoginStatus() async {
    final token = await SharedPreferencesAsync().getString("token");
    isLoggedIn = token != null;
  }

  void login(String phone, String code, Function completion) {
    // 登录逻辑
    client.codeLogin(phone, code).then((value) {
      if (value != null) {
        LoginModel login = LoginModel.fromJson(value);
        SharedPreferencesAsync().setString("token", login.accessToken);
        completion();
        isLoggedIn = true;
        notifyListeners();
      }
    });
  }

  void logout() {
    // 退出登录逻辑
    SharedPreferencesAsync().remove("token");
    isLoggedIn = false;
    notifyListeners();
  }
}
