import 'package:deliciousfood_flutter/common/widgets/horizental_wheel.dart';
import 'package:flutter/material.dart';

class RecommendDailyPage extends StatefulWidget {
  const RecommendDailyPage({super.key});

  @override
  State<RecommendDailyPage> createState() => _RecommendDailyPageState();
}

class _RecommendDailyPageState extends State<RecommendDailyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("每日三餐"),
        ),
        body: const DefaultTabController(
            length: 3,
            child: Column(
              children: [
                HorizontalWheel(
                  items: [
                    "早餐",
                    "午餐",
                    "下午茶",
                    "晚餐",
                    "夜宵",
                    "早餐",
                    "午餐",
                    "下午茶",
                    "晚餐",
                    "夜宵"
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: TabBar(tabs: [
                    Tab(
                      text: "早餐",
                    ),
                    Tab(
                      text: "午餐",
                    ),
                    Tab(
                      text: "晚餐",
                    ),
                  ]),
                ),
                Expanded(
                    child: TabBarView(children: [
                  Text("早餐"),
                  Text("午餐"),
                  Text("晚餐"),
                ]))
              ],
            )));
  }
}
