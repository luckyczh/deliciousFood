import 'package:deliciousfood_flutter/common/network/base/client.dart';
import 'package:deliciousfood_flutter/common/network/extension/user_client.dart';
import 'package:deliciousfood_flutter/models/mine/login_model.dart';
import 'package:deliciousfood_flutter/pages/login/code_login_view.dart';
import 'package:deliciousfood_flutter/pages/mine/mine_index.dart';
import 'package:deliciousfood_flutter/pages/rank/rank_index.dart';
import 'package:deliciousfood_flutter/pages/tab_index.dart';
import 'package:deliciousfood_flutter/providers/login_state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CodePage extends StatefulWidget {
  final String moblie;
  const CodePage({super.key, required this.moblie});

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "请输入4位数的验证码",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "短信已发送至${widget.moblie}",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: CupertinoTextField(
                  maxLength: 4,
                  placeholder: "请输入4位数字的验证码",
                  keyboardType: TextInputType.number,
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[300]!))),
                  onChanged: (value) {
                    if (value.length == 4) {
                      Provider.of<LoginStateProvider>(context, listen: false)
                          .login(widget.moblie, value, () {
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                      });
                    }
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        minimumSize:
                            const WidgetStatePropertyAll(Size(100, 30)),
                        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                        backgroundColor: const WidgetStatePropertyAll(
                            Color.fromARGB(255, 225, 223, 223)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)))),
                    child: const Text(
                      "重新获取",
                      style: TextStyle(color: Colors.black54),
                    )),
              )
            ],
          ),
        ));
  }
}
