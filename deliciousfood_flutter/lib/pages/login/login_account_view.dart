import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginAccountView extends StatefulWidget {
  const LoginAccountView({super.key});

  @override
  State<LoginAccountView> createState() => _LoginAccountViewState();
}

class _LoginAccountViewState extends State<LoginAccountView> {
  late final TextEditingController _accountEditingController;
  @override
  void initState() {
    super.initState();
    _accountEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return _codeLoginWidget();
  }

  Widget _codeLoginWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
            height: 60,
            child: CupertinoTextField(
              controller: _accountEditingController,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
              prefix: Text("+86"),
              placeholder: "请输入手机号",
              padding: const EdgeInsets.only(left: 10),
            )),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Colors.red),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)))),
          child: const Text(
            "获取短信验证码",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  minimumSize: WidgetStatePropertyAll(Size.zero),
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                  backgroundColor: const WidgetStatePropertyAll(
                      Color.fromARGB(255, 225, 223, 223)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)))),
              child: const Text(
                "使用账号密码登录",
                style: TextStyle(
                    color: Color.fromARGB(255, 100, 100, 100), fontSize: 12),
              )),
        )
      ],
    );
  }
}
