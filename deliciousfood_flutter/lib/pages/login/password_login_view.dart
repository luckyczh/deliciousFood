import 'package:deliciousfood_flutter/pages/login/login_protocol_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordLoginView extends StatefulWidget {
  final VoidCallback tap;
  const PasswordLoginView({super.key, required this.tap});

  @override
  State<PasswordLoginView> createState() => _PasswordLoginViewState();
}

class _PasswordLoginViewState extends State<PasswordLoginView> {
  final _accountEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              placeholder: "请输入账号",
            )),
        SizedBox(
            height: 60,
            child: CupertinoTextField(
              controller: _passwordEditingController,
              obscureText: true,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
              placeholder: "请输入密码",
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
            "登录",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      widget.tap();
                    },
                    style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        minimumSize: const WidgetStatePropertyAll(Size.zero),
                        padding: const WidgetStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
                        backgroundColor: const WidgetStatePropertyAll(
                            Color.fromARGB(255, 225, 223, 223)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)))),
                    child: const Text(
                      "使用手机号快捷登录",
                      style: TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100),
                          fontSize: 12),
                    )),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "忘记密码？",
                    style: TextStyle(
                        color: Color.fromARGB(255, 100, 100, 100),
                        fontSize: 11),
                  ),
                )
              ],
            )),
        LoginProtocolView(statusChangedCallback: (isSelected) {})
      ],
    );
    ;
  }
}
