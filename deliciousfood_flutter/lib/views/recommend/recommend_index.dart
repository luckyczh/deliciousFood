import 'package:card_swiper/card_swiper.dart';
import 'package:deliciousfood_flutter/common/network/base/client.dart';
import 'package:deliciousfood_flutter/common/network/extension/home_client.dart';
import 'package:deliciousfood_flutter/models/home/home_recommend_model.dart';
import 'package:deliciousfood_flutter/views/recommend/widget/recommend_appbar.dart';
import 'package:deliciousfood_flutter/views/recommend/widget/recommend_banner.dart';
import 'package:deliciousfood_flutter/views/recommend/widget/recommend_feedrecipe.dart';
import 'package:deliciousfood_flutter/views/recommend/widget/recommend_hotrecipe.dart';
import 'package:deliciousfood_flutter/views/recommend/widget/recommend_jieqi.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RecommendIndexWidget extends StatefulWidget {
  const RecommendIndexWidget({super.key});

  @override
  State<RecommendIndexWidget> createState() => _RecommendIndexWidgetState();
}

class _RecommendIndexWidgetState extends State<RecommendIndexWidget> {
  late RefreshController _refreshController;

  HomeRecommendModel? sancanModel;
  HomeRecommendModel? jieqiModel;
  HomeRecommendModel? hotRecipeModel;

  void _onLoading() async {}

  void _getRecommendData() async {
    client.getHomeRecommendData().then((value) {
      sancanModel = value.firstWhere((element) => element.type == "2");
      jieqiModel = value.firstWhere((element) => element.type == "11");
      hotRecipeModel = value.firstWhere((element) => element.type == "9");
      setState(() {});
      _refreshController.loadComplete();
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    _getRecommendData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const RecommendAppbar(),
          body: sancanModel == null
              ? _loadingWidget()
              : SmartRefresher(
                  controller: _refreshController,
                  enablePullDown: true,
                  enablePullUp: true,
                  header: const WaterDropHeader(),
                  footer: const ClassicFooter(),
                  onLoading: _onLoading,
                  onRefresh: _getRecommendData,
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      const SliverPadding(padding: EdgeInsets.only(top: 20)),
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
      child: SizedBox(
          height: 444,
          child: Swiper(
            itemCount: sancanModel?.sancan?.length ?? 0,
            outer: true,
            itemBuilder: (context, index) {
              return RecommendBanner(
                model: sancanModel?.sancan?[index],
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
        child: RecommendJieQi(
      model: jieqiModel?.jieqiSc,
    ));
  }

  Widget _hotvideoSliver() {
    return const SliverToBoxAdapter(child: RecommendHotRecipe());
  }

  Widget _feedRecipeSliver() {
    return SliverList.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const RecommendFeedRecipe();
      },
    );
  }

  Widget _loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
