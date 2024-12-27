import 'package:flutter/material.dart';

typedef StatusChangedCallback = void Function(bool);

class LoginProtocolView extends StatefulWidget {
  final StatusChangedCallback statusChangedCallback;
  const LoginProtocolView({super.key, required this.statusChangedCallback});
  @override
  State<LoginProtocolView> createState() => _LoginProtocolViewState();
}

class _LoginProtocolViewState extends State<LoginProtocolView> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 225, 223, 223),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            // constraints: const BoxConstraints(maxWidth: 20),
            iconSize: 20,
            // style: const ButtonStyle(
            //     overlayColor: WidgetStatePropertyAll(Colors.transparent)),
            isSelected: _isSelected,
            onPressed: () {
              _isSelected = !_isSelected;
              widget.statusChangedCallback(_isSelected);
              setState(() {});
            },
            selectedIcon: const Icon(
              Icons.check_circle_rounded,
              color: Colors.red,
            ),
            icon: const Icon(
              Icons.circle_outlined,
            ),
          ),
          RichText(
              text: const TextSpan(children: [
            TextSpan(
              text: "登录即表示同意 ",
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 100, 100, 100)),
            ),
            TextSpan(
              text: "美食杰用户协议",
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
            TextSpan(
              text: " 和 ",
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 100, 100, 100)),
            ),
            TextSpan(
              text: "隐私政策",
              style: TextStyle(fontSize: 12, color: Colors.red),
            )
          ]))
        ],
      ),
    );
  }
}
