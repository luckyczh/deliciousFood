import 'package:card_swiper/card_swiper.dart';
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
  final RefreshController _refreshController = RefreshController();

  void _onRefresh() async {}

  void _onLoading() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const RecommendAppbar(),
          body: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            header: const WaterDropHeader(),
            footer: const ClassicFooter(),
            onLoading: _onLoading,
            onRefresh: _onRefresh,
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
          height: 434,
          child: Swiper(
            itemCount: 3,
            outer: true,
            itemBuilder: (context, index) {
              return const RecommendBanner();
            },
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.red, color: Colors.grey.shade400),
            ),
          )),
    );
  }

  Widget _jieqiSliver() {
    return const SliverToBoxAdapter(child: RecommendJieQi());
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
}
