import 'package:card_swiper/card_swiper.dart';
import 'package:deliciousfood_flutter/views/recommend/widget/recommend_appbar.dart';
import 'package:deliciousfood_flutter/views/recommend/widget/recommend_banner.dart';
import 'package:deliciousfood_flutter/views/recommend/widget/recommend_hotrecipe.dart';
import 'package:deliciousfood_flutter/views/recommend/widget/recommend_jieqi.dart';
import 'package:flutter/material.dart';

class RecommendIndexWidget extends StatefulWidget {
  const RecommendIndexWidget({super.key});

  @override
  State<RecommendIndexWidget> createState() => _RecommendIndexWidgetState();
}

class _RecommendIndexWidgetState extends State<RecommendIndexWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const RecommendAppbar(),
            body: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [_bannerSliver(), _jieqiSliver(), _hotvideoSliver()],
              ),
            )));
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
}
