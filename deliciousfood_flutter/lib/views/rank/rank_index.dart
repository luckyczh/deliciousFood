import 'package:deliciousfood_flutter/common/network/base/client.dart';
import 'package:deliciousfood_flutter/common/network/extension/home_client.dart';
import 'package:deliciousfood_flutter/common/widgets/refresh_widget.dart';
import 'package:deliciousfood_flutter/views/recommend/widget/recommend_feedrecipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/utils/utils.dart';
import '../../models/home/home_feed_model.dart';

class RankIndexWidget extends StatefulWidget {
  const RankIndexWidget({super.key});

  @override
  State<RankIndexWidget> createState() => _RankIndexWidgetState();
}

class _RankIndexWidgetState extends State<RankIndexWidget>
    with AutomaticKeepAliveClientMixin {
  double appBarAlpha = 0;
  late List<HomeFeedModel> list;
  int page = 1;
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

  _getRankList(RefreshPageController? controller) async {
    int page = controller?.page ?? 1;
    final result = await client.getRankList(page: page);
    if (page == 1) {
      list.clear();
    }
    list.addAll(result);
    controller?.refreshCompleted();
    if (result.length < 10) {
      controller?.loadNoData();
    } else {
      controller?.loadComplete();
    }
    setState(() {});
  }

  _onLoading(RefreshPageController controller) async {
    await _getRankList(controller);
    controller.loadComplete();
  }

  _onRefresh(RefreshPageController controller) async {
    await _getRankList(controller);
    controller.refreshCompleted();
  }

  @override
  void initState() {
    list = [];
    _getRankList(null);
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
                    child: RefreshWidget(
                      onLoading: (controller) => _onLoading(controller),
                      onRefresh: (controller) => _onRefresh(controller),
                      child: ListView.separated(
                          padding: const EdgeInsets.only(top: 0),
                          itemBuilder: (context, index) => _buildCell(index),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: list.length),
                    )),
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

  Widget _buildCell(int index) {
    if (index == 0) {
      return netWorkImage(
          "https://st-cn.meishi.cc/p2/20230209/20230209150550_650.png",
          width: double.infinity,
          fit: BoxFit.fitWidth);
    }
    HomeFeedModel model = list[index - 1];
    RecommendFeedRecipe recipe = RecommendFeedRecipe(
      model: model.type == "1" ? model.recipe! : model.videoRecipe!,
      index: index,
    );
    if (index == 1) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 110,
          ),
          Positioned(
            top: -40,
            left: 0,
            right: 0,
            child: recipe,
          )
        ],
      );
    }
    return recipe;
  }

  @override
  bool get wantKeepAlive => true;
}
