import 'package:card_swiper/card_swiper.dart';
import 'package:deliciousfood_flutter/views/recommend/recommend_appbar.dart';
import 'package:deliciousfood_flutter/views/recommend/recommend_banner.dart';
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
    return SliverToBoxAdapter(
      child: Card(
        shadowColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        margin: const EdgeInsets.all(20),
        child: Container(
            height: 300,
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 20,
                      child: const Text(
                        "二十四节气养生食谱",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                const Text(
                  "小满",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "5月21日 - 6月5日",
                  style: TextStyle(
                      color: Color.fromARGB(255, 206, 199, 199),
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                )
              ],
            )),
      ),
    );
  }
}
