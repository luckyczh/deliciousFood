import 'package:deliciousfood_flutter/common/network/base/api.dart';
import 'package:deliciousfood_flutter/common/network/base/client.dart';
import 'package:deliciousfood_flutter/common/network/extension/user_client.dart';
import 'package:deliciousfood_flutter/common/utils/utils.dart';
import 'package:deliciousfood_flutter/pages/login/code_page.dart';
import 'package:deliciousfood_flutter/pages/login/login_protocol_view.dart';
import 'package:deliciousfood_flutter/pages/mine/mine_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum LoginType { code, password }

class CodeLoginView extends StatefulWidget {
  final VoidCallback tap;
  const CodeLoginView({super.key, required this.tap});

  @override
  State<CodeLoginView> createState() => _CodeLoginViewState();
}

class _CodeLoginViewState extends State<CodeLoginView> {
  late final _accountEditingController = TextEditingController();
  bool isAgree = false;
  @override
  void initState() {
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
              keyboardType: TextInputType.number,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
              prefix: const Text("+86"),
              placeholder: "请输入手机号",
              padding: const EdgeInsets.only(left: 10),
            )),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {
            sendMsg(() {
              pushToPage(
                  context, CodePage(moblie: _accountEditingController.text));
            });
          },
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
                "使用账号密码登录",
                style: TextStyle(
                    color: Color.fromARGB(255, 100, 100, 100), fontSize: 12),
              )),
        ),
        LoginProtocolView(statusChangedCallback: (isSelected) {
          isAgree = isSelected;
        })
      ],
    );
  }

  void sendMsg(VoidCallback completion) {
    FocusScope.of(context).unfocus();
    if (_accountEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "请输入手机号");
      return;
    }
    if (!isAgree) {
      Fluttertoast.showToast(msg: "请同意用户协议和额隐私政策");
      return;
    }
    client.sendMsg(_accountEditingController.text).then((value) {
      completion();
    });
  }
}
