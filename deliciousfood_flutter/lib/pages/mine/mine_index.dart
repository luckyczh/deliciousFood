import 'package:deliciousfood_flutter/common/network/base/client.dart';
import 'package:deliciousfood_flutter/common/network/extension/user_client.dart';
import 'package:deliciousfood_flutter/common/utils/utils.dart';
import 'package:deliciousfood_flutter/models/home/home_feed_model.dart';
import 'package:deliciousfood_flutter/pages/login/login_page.dart';
import 'package:deliciousfood_flutter/pages/mine/mine_filter_button.dart';
import 'package:deliciousfood_flutter/pages/recommend/widget/recommend_feedrecipe.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../models/mine/person_model.dart';
import 'mine_index_header.dart';

class MineIndexWidget extends StatefulWidget {
  const MineIndexWidget({super.key});

  @override
  State<MineIndexWidget> createState() => _MineIndexWidgetState();
}

class _MineIndexWidgetState extends State<MineIndexWidget>
    with AutomaticKeepAliveClientMixin {
  PersonModel? model;
  List<HomeFeedModel>? feedList;
  int pageIndex = 1;

  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return VisibilityDetector(
      key: const Key('mine-widget-key'),
      child: CustomScrollView(
        slivers: isLogin
            ? [_topWidget(), _changeListWidget(), _feedRecipeSliver()]
            : [_topWidget(), _loginWidget(context)],
      ),
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 1) {
          _getLoginStates();
        }
      },
    );
  }

  @override
  void initState() {
    _getLoginStates();
    super.initState();
  }

  void _getLoginStates() {
    SharedPreferencesAsync().getString("token").then((value) {
      if (value != null) {
        isLogin = true;
        _getPersonInfo();
        _getFavList();
        setState(() {});
      }
    });
  }

  void _getPersonInfo() async {
    model = await client.getUerInfo();
    setState(() {});
  }

  void _getFavList() async {
    final list = await client.getFavList(pageIndex);
    if (pageIndex == 1) {
      feedList = list;
    } else {
      feedList?.addAll(list);
    }
    setState(() {});
  }

  void _getHistoryList() async {
    final list = await client.getRecentList(pageIndex);
    if (pageIndex == 1) {
      feedList = list;
    } else {
      feedList?.addAll(list);
    }
    setState(() {});
  }

  Widget _topWidget() {
    return SliverToBoxAdapter(
      child: MineIndexHeader(
        model: model,
      ),
    );
  }

  Widget _changeListWidget() {
    return SliverToBoxAdapter(child: MineFilterButton(onTap: (index) {
      pageIndex = 1;
      if (index == 0) {
        _getFavList();
      } else {
        _getHistoryList();
      }
    }));
  }

  Widget _feedRecipeSliver() {
    return SliverList.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: feedList?.length ?? 0,
      itemBuilder: (context, index) {
        return RecommendFeedRecipe(
          model: feedList![index],
        );
      },
    );
  }

  Widget _loginWidget(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("您还未登录",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                const Text("登录后可享受更多功能和福利",
                    style: TextStyle(color: Colors.black87, fontSize: 15)),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    pushToPage(context, const LoginPage());
                  },
                  child: Container(
                    height: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.red[400]),
                    child: const Text(
                      "登录美食杰",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            )));
  }

  @override
  bool get wantKeepAlive => true;
}

// class MyPainter extends CustomPainter {
//   final List<Color> colors;

//   MyPainter(this.colors);
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = colors.first
//       ..style = PaintingStyle.fill;
//     final centerX = size.width / 2.0;
//     // var path = Path();
//     // path.moveTo(centerX - 3, 0);
//     // path.quadraticBezierTo(centerX, -5, centerX + 3, 0);
//     // path.lineTo(centerX + 75, 150);
//     // path.quadraticBezierTo(centerX + 76, 154, centerX + 72, 154);
//     // path.lineTo(centerX - 72, 154);
//     // path.quadraticBezierTo(centerX - 76, 154, centerX - 75, 150);
//     // path.close();
//     // canvas.drawPath(path, paint);
//     paint.color = Colors.pink;
//     var topPath = Path();
//     topPath.moveTo(centerX - 3, 0);
//     topPath.quadraticBezierTo(centerX, -5, centerX + 3, 0);
//     topPath.lineTo(centerX + 25, 45);
//     topPath.lineTo(centerX - 25, 45);
//     topPath.close();
//     canvas.drawPath(topPath, paint);

//     paint.color = colors[1];
//     var middlePath = Path();
//     middlePath.moveTo(centerX - 27, 50);
//     middlePath.lineTo(centerX + 27, 50);
//     middlePath.lineTo(centerX + 49, 95);
//     middlePath.lineTo(centerX - 49, 95);
//     middlePath.close();
//     canvas.drawPath(middlePath, paint);

//     paint.color = colors[2];
//     var bottomPath = Path();
//     bottomPath.moveTo(centerX - 51, 100);
//     bottomPath.lineTo(centerX + 51, 100);
//     bottomPath.lineTo(centerX + 75, 150);
//     bottomPath.quadraticBezierTo(centerX + 76, 154, centerX + 72, 154);
//     bottomPath.lineTo(centerX - 72, 154);
//     bottomPath.quadraticBezierTo(centerX - 76, 154, centerX - 75, 150);
//     bottomPath.close();
//     canvas.drawPath(bottomPath, paint);
//   }

//   @override
//   bool shouldRepaint(MyPainter oldDelegate) => false;

//   @override
//   bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
// }
