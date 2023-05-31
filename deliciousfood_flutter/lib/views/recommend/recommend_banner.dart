import 'package:deliciousfood_flutter/models/home/home_recommend_banner_model.dart';
import 'package:deliciousfood_flutter/models/home/home_recommend_sancan_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendBanner extends StatefulWidget {
  const RecommendBanner({super.key});

  @override
  State<RecommendBanner> createState() => _RecommendBannerState();
}

class _RecommendBannerState extends State<RecommendBanner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "今日午餐",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
          const Row(
            children: [
              Expanded(
                  flex: 2,
                  child: RecommendBannerFood(
                    height: 350,
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      RecommendBannerFood(height: 170),
                      SizedBox(
                        height: 10,
                      ),
                      RecommendBannerFood(height: 170)
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class RecommendBannerFood extends StatelessWidget {
  final double height;
  // final HomeRecommendSancanModel model;
  const RecommendBannerFood({super.key, required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://img2.baidu.com/it/u=3628561281,1488805814&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "梵高星空",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: height == 350 ? 18 : 15,
                        fontWeight: FontWeight.bold),
                  ),
                  _desWidget()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _desWidget() {
    return height == 350
        ? const Text("营养丰富，早餐最爱",
            style: TextStyle(color: Colors.white, fontSize: 14))
        : const SizedBox();
  }
}
