import 'package:deliciousfood_flutter/common/utils/utils.dart';
import 'package:deliciousfood_flutter/models/mine/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MineIndexHeader extends StatefulWidget {
  final PersonModel? model;
  const MineIndexHeader({super.key, required this.model});

  @override
  State<MineIndexHeader> createState() => _MineIndexHeaderState();
}

class _MineIndexHeaderState extends State<MineIndexHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        netWorkImage(
            "https://st-cn.meishi.cc/p2/20220907/20220907154552_483.jpg"),
        Positioned(
            top: ScreenUtil().statusBarHeight,
            right: 20,
            child: const Row(
              children: [
                Icon(
                  Icons.email_outlined,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.settings,
                )
              ],
            )),
        Positioned(
          top: ScreenUtil().statusBarHeight + 80,
          left: 20,
          right: 150,
          child: Text(
            "Hi,\n${widget.model == null ? "请登录" : widget.model?.userInfo?.userName ?? ''}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
        Positioned(
          top: ScreenUtil().statusBarHeight + 80,
          right: 20,
          child: Container(
              padding: const EdgeInsets.all(4),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(52)),
              child: widget.model == null
                  ? const SizedBox()
                  : netWorkImage(widget.model?.userInfo?.avatar,
                      width: 100, height: 100, radius: 50)),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: _bottomWidget(['0', '0', '1', '0'])),
      ],
    );
  }

  Widget _bottomWidget(List<String> num) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ['访客', '粉丝', '关注', '发布']
            .asMap()
            .entries
            .map((e) => Column(
                  children: [
                    Text(
                      num[e.key],
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      e.value,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ))
            .toList());
  }
}
