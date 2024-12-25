import 'package:card_swiper/card_swiper.dart';
import 'package:deliciousfood_flutter/common/network/base/client.dart';
import 'package:deliciousfood_flutter/common/network/extension/home_client.dart';
import 'package:deliciousfood_flutter/common/widgets/refresh_widget.dart';
import 'package:deliciousfood_flutter/models/home/home_feed_model.dart';
import 'package:deliciousfood_flutter/models/home/home_recommend_model.dart';
import 'package:deliciousfood_flutter/pages/recommend/widget/recommend_appbar.dart';
import 'package:deliciousfood_flutter/pages/recommend/widget/recommend_banner.dart';
import 'package:deliciousfood_flutter/pages/recommend/widget/recommend_feedrecipe.dart';
import 'package:deliciousfood_flutter/pages/recommend/widget/recommend_hotrecipe.dart';
import 'package:deliciousfood_flutter/pages/recommend/widget/recommend_jieqi.dart';
import 'package:flutter/material.dart';

import '../../common/utils/utils.dart';

class RecommendIndexWidget extends StatefulWidget {
  const RecommendIndexWidget({super.key});

  @override
  State<RecommendIndexWidget> createState() => _RecommendIndexWidgetState();
}

class _RecommendIndexWidgetState extends State<RecommendIndexWidget>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  HomeRecommendModel? sancanModel;
  HomeRecommendModel? jieqiModel;
  HomeRecommendModel? hotRecipeModel;
  late List<HomeFeedModel> list;

  _onRefresh(RefreshPageController? controller) async {
    page = 1;
    _getFeedData(controller);
    _getRecommendData();
  }

  _onLoading(RefreshPageController? controller) async {
    page += 1;
    _getFeedData(controller);
  }

  void _getRecommendData() async {
    client.getHomeRecommendData().then((value) {
      if (value.isEmpty) {
        return;
      }
      try {
        sancanModel = value.firstWhere((element) => element.type == "2");
        jieqiModel = value.firstWhere((element) => element.type == "11");
        hotRecipeModel = value.firstWhere((element) => element.type == "9");
      } finally {
        setState(() {});
      }
    });
  }

  void _getFeedData(RefreshPageController? controller) async {
    int page = controller?.page ?? 1;
    client.getHomeFeedData(page: page).then((value) {
      final tmpValue = List.from(value);
      if (page == 1) {
        list.clear();
      }
      value.removeWhere((element) => element.type != "1");
      list.addAll(value);
      controller?.refreshCompleted();
      controller?.loadComplete();
      if (tmpValue.length < 24) {
        controller?.loadNoData();
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    list = [];
    _getRecommendData();
    _getFeedData(null);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
          appBar: const RecommendAppbar(),
          body: sancanModel == null
              ? loadingWidget()
              : RefreshWidget(
                  onLoading: (controller) => _onLoading(controller),
                  onRefresh: (controller) => _onRefresh(controller),
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      _bannerSliver(),
                      _jieqiSliver(),
                      _hotvideoSliver(),
                      _feedRecipeSliver()
                    ],
                  ),
                )),
    );
  }

  Widget _bannerSliver() {
    return SliverToBoxAdapter(
      child: sancanModel == null
          ? const SizedBox()
          : SizedBox(
              height: 444,
              child: Swiper(
                itemCount: sancanModel?.sancan?.length ?? 0,
                outer: true,
                itemBuilder: (context, index) {
                  return RecommendBanner(
                    model: sancanModel!.sancan?[index],
                  );
                },
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.red, color: Colors.grey.shade400),
                ),
              )),
    );
  }

  Widget _jieqiSliver() {
    return SliverToBoxAdapter(
        child: jieqiModel == null
            ? const SizedBox()
            : RecommendJieQi(
                model: jieqiModel?.jieqiSc,
              ));
  }

  Widget _hotvideoSliver() {
    return SliverToBoxAdapter(
        child: hotRecipeModel == null
            ? const SizedBox()
            : RecommendHotRecipe(
                model: hotRecipeModel!,
              ));
  }

  Widget _feedRecipeSliver() {
    return SliverList.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return RecommendFeedRecipe(
          model: list[index],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
