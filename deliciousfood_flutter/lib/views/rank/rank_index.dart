import 'package:deliciousfood_flutter/common/widgets/cached_image.dart';
import 'package:deliciousfood_flutter/models/home/home_feed_recipe_model.dart';
import 'package:deliciousfood_flutter/views/recommend/widget/recommend_feedrecipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankIndexWidget extends StatefulWidget {
  const RankIndexWidget({super.key});

  @override
  State<RankIndexWidget> createState() => _RankIndexWidgetState();
}

class _RankIndexWidgetState extends State<RankIndexWidget> {
  double appBarAlpha = 0;

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
    print(appBarAlpha);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification &&
                  notification.depth == 0) {
                _onScroll(notification.metrics.pixels);
              }
              return true;
            },
            // child: ListView.separated(
            //     itemBuilder: (context, index) {
            // return RecommendFeedRecipe(
            //   model: HomeFeedRecipeModel(
            //       img:
            //           "http://st-cn.meishi.cc/r/151/25/9881401/s9881401_149715511631939.jpg",
            //       title: "既爱唱范围发",
            //       shicai: ["排骨"]),
            // );
            //     },
            //     separatorBuilder: (context, index) =>
            //         const SizedBox(height: 20),
            //     itemCount: 10),
            child: CustomScrollView(
              slivers: [_topSliver(), _listSliver()],
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
              height: ScreenUtil().statusBarHeight + 44,
              color: Colors.white,
              child: const Center(
                child: Text(
                  "排行榜",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _topSliver() {
    return SliverToBoxAdapter(
        child: netWorkImage(
            "https://st-cn.meishi.cc/p2/20230209/20230209150550_650.png",
            width: double.infinity,
            fit: BoxFit.fitWidth));
  }

  Widget _listSliver() {
    return SliverToBoxAdapter(
      child: Transform(
        transform: Matrix4.translationValues(0, -20, 0),
        child: SliverList.separated(
          itemBuilder: (context, index) {
            return RecommendFeedRecipe(
              model: HomeFeedRecipeModel(
                  img:
                      "http://st-cn.meishi.cc/r/151/25/9881401/s9881401_149715511631939.jpg",
                  title: "既爱唱范围发",
                  shicai: ["排骨"]),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
        ),
      ),
    );
  }
}
