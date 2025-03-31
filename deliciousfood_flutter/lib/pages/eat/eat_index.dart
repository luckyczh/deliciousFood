import 'package:deliciousfood_flutter/common/network/base/client.dart';
import 'package:deliciousfood_flutter/common/network/extension/home_client.dart';
import 'package:deliciousfood_flutter/models/eat/eat_question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/utils/utils.dart';
import '../../common/utils/extension.dart';

class EatIndexWidget extends StatefulWidget {
  const EatIndexWidget({super.key});

  @override
  State<EatIndexWidget> createState() => _EatIndexWidgetState();
}

class _EatIndexWidgetState extends State<EatIndexWidget>
    with AutomaticKeepAliveClientMixin {
  List<EatQuestionModel> list = [];
  double appBarAlpha = 0;

  _getEatList() async {
    final result = await client.getEatList();
    list = result;
    setState(() {});
  }

  @override
  void initState() {
    _getEatList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: list.isEmpty
          ? loadingWidget()
          : Stack(
              children: [
                /// 监听滑动
                NotificationListener(
                  onNotification: (notification) {
                    if (notification is ScrollUpdateNotification &&
                        notification.depth == 0) {
                      _onScroll(notification.metrics.pixels);
                    }
                    return true;
                  },
                  child: ListView.separated(
                      padding: const EdgeInsets.only(top: 0),
                      itemBuilder: (context, index) => _buildCell(index),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                      itemCount: list.length + 1),
                ),
                Opacity(
                  opacity: appBarAlpha,
                  child: Container(
                    padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
                    height: ScreenUtil().statusBarHeight + 44,
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        "吃什么",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }

  Widget _buildCell(int index) {
    if (index == 0) {
      return Image.asset("resource/images/icon_eat_header.png",
          width: double.infinity, fit: BoxFit.fitWidth);
    }
    EatQuestionModel model = list[index - 1];
    Widget cell = _normalCell(model);
    if (index == 1) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 125,
          ),
          Positioned(
            top: -45,
            left: 0,
            right: 0,
            child: cell,
          )
        ],
      );
    }
    if (model.type == "1") {
      return cell;
    }
    if (model.type == "2") {
      return _pregnantCell(model);
    }
    return _bottomCell(model);
  }

  /// 孕妇cell
  Widget _pregnantCell(EatQuestionModel model) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            decoration: BoxDecoration(
                color: model.color?.rgbToColor(alpha: 0.1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (model.data ?? [])
                    .map((e) => _pregnantCellItem(e))
                    .toList()),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: netWorkImage(model.zsImg, width: 80),
        )
      ],
    );
  }

  Widget _pregnantCellItem(EatQuestionZsModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.title ?? "",
          style: const TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          model.des ?? "",
          style: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: (model.item ?? []).map((e) {
            /// 计算透明度梯度
            double stride = 0.5 / (e.item?.length ?? 0);
            double alpha = 0.5;
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: (e.item ?? []).map((p) {
                  alpha += stride;
                  return Container(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    decoration: BoxDecoration(
                        color: e.color?.rgbToColor(alpha: alpha),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      p.txt ?? "",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 13),
                    ),
                  );
                }).toList(),
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  /// 底部cell
  Widget _bottomCell(EatQuestionModel model) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: model.item?.length ?? 0,
        padding: const EdgeInsets.only(left: 15, right: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 120),
        itemBuilder: (context, index) {
          EatQuestionModel? tmpModel = model.item?[index];
          return Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: tmpModel?.color?.rgbToColor(alpha: 0.1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tmpModel?.question ?? "",
                  style: TextStyle(
                      color: tmpModel?.color?.rgbToColor(),
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: tmpModel?.color?.rgbToColor(alpha: 0.9)),
                  child: Center(
                    child: Text(
                      tmpModel?.btntxt ?? "",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  /// 普通列表cell
  Widget _normalCell(EatQuestionModel model) {
    // model.color
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: model.color?.rgbToColor(alpha: 0.1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                children: [
                  netWorkImage(model.icon, width: 35, height: 35),
                  Text(
                    model.title ?? "",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: model.color?.rgbToColor(alpha: 0.9)),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  netWorkImage(model.img, width: 130, height: 90, radius: 10),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        model.question ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: model.color?.rgbToColor(alpha: 0.8)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: model.color?.rgbToColor(alpha: 0.9)),
                        child: Center(
                          child: Text(
                            model.btntxt ?? "",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              )
            ],
          ),
        ));
  }

  _onScroll(offset) {
    double alpha = offset / (ScreenUtil().statusBarHeight + 44);
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
