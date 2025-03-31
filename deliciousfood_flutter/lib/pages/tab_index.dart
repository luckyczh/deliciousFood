import 'package:deliciousfood_flutter/pages/eat/eat_index.dart';
import 'package:deliciousfood_flutter/pages/mine/mine_index.dart';
import 'package:deliciousfood_flutter/pages/rank/rank_index.dart';
import 'package:deliciousfood_flutter/pages/recommend/page/recommend_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabIndexWidget extends StatefulWidget {
  const TabIndexWidget({super.key});

  @override
  State<TabIndexWidget> createState() => _TabIndexWidgetState();
}

class _TabIndexWidgetState extends State<TabIndexWidget>
    with SingleTickerProviderStateMixin {
  static const List<BottomNavigationBarItem> myTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.recommend), label: "推荐"),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: "排行榜"),
    BottomNavigationBarItem(icon: Icon(Icons.breakfast_dining), label: "吃什么"),
    BottomNavigationBarItem(icon: Icon(Icons.headphones), label: "我的"),
  ];
  static const List<Widget> myControllers = [
    RecommendIndexWidget(),
    RankIndexWidget(),
    EatIndexWidget(),
    MineIndexWidget()
  ];
  late PageController _pageController;
  int _selected = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        items: myTabs,
        backgroundColor: Colors.white,
        border: const Border(),
        currentIndex: _selected,
        inactiveColor: Colors.grey,
        activeColor: Colors.pink,
        onTap: (value) {
          setState(() {
            _selected = value;
            _pageController.jumpToPage(value);
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: myControllers,
      ),
    );
  }
}
