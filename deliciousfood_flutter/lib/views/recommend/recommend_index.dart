import 'package:card_swiper/card_swiper.dart';
import 'package:deliciousfood_flutter/views/recommend/recommend_appbar.dart';
import 'package:deliciousfood_flutter/views/recommend/recommend_banner.dart';
import 'package:deliciousfood_flutter/views/recommend/recommend_jieqi.dart';
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
                slivers: [_bannerSliver(), _jieqiSliver()],
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
    return SliverToBoxAdapter(child: RecommendJieQi());
  }
}
