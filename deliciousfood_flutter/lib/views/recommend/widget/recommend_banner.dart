import 'package:deliciousfood_flutter/common/widgets/cached_image.dart';
import 'package:flutter/material.dart';

import '../../../models/home/home_recommend_model.dart';
import '../../../models/home/home_recommend_sancan_model.dart';

class RecommendBanner extends StatefulWidget {
  final HomeRecommendModel? model;
  const RecommendBanner({super.key, required this.model});

  @override
  State<RecommendBanner> createState() => _RecommendBannerState();
}

class _RecommendBannerState extends State<RecommendBanner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "今日${widget.model?.title ?? ""}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    padding: MaterialStateProperty.all(EdgeInsets.zero)),
                onPressed: () {},
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "更多三餐推荐",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w200),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                        size: 14,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: RecommendBannerFood(
                    height: 350,
                    model: widget.model?.items?[0],
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      RecommendBannerFood(
                        height: 170,
                        model: widget.model?.items?[1],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RecommendBannerFood(
                        height: 170,
                        model: widget.model?.items?[2],
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class RecommendBannerFood extends StatefulWidget {
  final double height;
  final HomeRecommendSancanModel? model;
  const RecommendBannerFood({super.key, required this.height, this.model});

  @override
  State<RecommendBannerFood> createState() => _RecommendBannerFoodState();
}

class _RecommendBannerFoodState extends State<RecommendBannerFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          netWorkImage(widget.model?.img ?? ""),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 20, left: 10, right: 10, top: 20),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0x00000000), Color(0xaa000000)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model?.title ?? "",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.height == 350 ? 18 : 15,
                          fontWeight: FontWeight.bold),
                    ),
                    _desWidget()
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _desWidget() {
    return widget.height == 350
        ? Text(widget.model?.desc ?? "",
            style: const TextStyle(color: Colors.white, fontSize: 14))
        : const SizedBox();
  }
}
