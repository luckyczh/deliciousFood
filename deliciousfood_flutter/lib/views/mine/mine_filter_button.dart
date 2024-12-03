import 'dart:math';

import 'package:flutter/material.dart';

class MineFilterButton extends StatefulWidget {
  final Function(int) onTap;
  const MineFilterButton({super.key, required this.onTap});

  @override
  State<MineFilterButton> createState() => _MineFilterButtonState();
}

class _MineFilterButtonState extends State<MineFilterButton> {
  int selecteType = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      child: Row(
        children: [
          BubbleBackground(
            isSelected: selecteType == 0,
            text: "我的收藏",
            onPress: () {
              selecteType = 0;
              widget.onTap(0);
              setState(() {});
            },
            selectedBuilder: () {
              return SizedBox();
            },
          ),
          const SizedBox(width: 14),
          BubbleBackground(
            isSelected: selecteType == 1,
            text: "浏览历史",
            onPress: () {
              selecteType = 1;
              widget.onTap(1);
              setState(() {});
            },
            selectedBuilder: () {
              return TextButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white30,
                    ),
                    alignment: Alignment.center,
                    width: 40,
                    height: 24,
                    child: const Text(
                      "清除",
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}

class BubbleBackground extends StatelessWidget {
  final bool isSelected;
  final String text;
  final GestureTapCallback? onPress;
  final Widget Function() selectedBuilder;
  const BubbleBackground(
      {super.key,
      required this.isSelected,
      required this.text,
      required this.onPress,
      required this.selectedBuilder});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: isSelected ? 2 : 1,
        child: ClipPath(
            clipper: BubbleClipper(isSelected: isSelected),
            child: InkWell(
              onTap: onPress,
              child: Container(
                  height: 54,
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
                  alignment: Alignment.center,
                  color: isSelected
                      ? Colors.yellow
                      : const Color.fromARGB(255, 224, 222, 222),
                  child: Row(
                    mainAxisAlignment: isSelected
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                            color: isSelected ? Colors.black87 : Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      isSelected ? selectedBuilder() : const SizedBox()
                    ],
                  )),
            )));
  }
}

class BubbleClipper extends CustomClipper<Path> {
  final bool isSelected;

  BubbleClipper({super.reclip, required this.isSelected});
  @override
  Path getClip(Size size) {
    var path = Path();
    path.arcTo(Rect.fromCircle(center: const Offset(8, 8), radius: 8), -pi,
        pi * 0.5, false);
    path.lineTo(size.width - 8, 0);
    path.arcTo(Rect.fromCircle(center: Offset(size.width - 8, 8), radius: 8),
        -pi * 0.5, pi * 0.5, false);
    path.lineTo(size.width, size.height - 18);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(size.width - 8, size.height - 18), radius: 8),
        0,
        pi * 0.5,
        false);
    if (isSelected) {
      path.lineTo(26, size.height - 10);
      path.lineTo(20, size.height - 4);
      path.lineTo(14, size.height - 10);
    }
    path.lineTo(8, size.height - 10);
    path.arcTo(Rect.fromCircle(center: Offset(8, size.height - 18), radius: 8),
        pi * 0.5, pi * 0.5, false);
    path.lineTo(0, 8);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
