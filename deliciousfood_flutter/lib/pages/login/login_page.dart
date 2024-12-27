import 'package:deliciousfood_flutter/pages/login/code_login_view.dart';
import 'package:deliciousfood_flutter/pages/login/password_login_view.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "美食杰",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "登录美食杰",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
            ),
            const Text(
              "如果您的手机号未注册，将自动以改手机号注册",
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            Expanded(
                child: PageView(
              controller: pageController,
              children: [
                CodeLoginView(tap: () {
                  pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.decelerate);
                }),
                PasswordLoginView(tap: () {
                  pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.decelerate);
                })
              ],
            ))
          ],
        ),
      ),
    );
  }
}
