import 'package:deliciousfood_flutter/views/eat/eat_index.dart';
import 'package:deliciousfood_flutter/views/mine/mine_index.dart';
import 'package:deliciousfood_flutter/views/rank/rank_index.dart';
import 'package:deliciousfood_flutter/views/recommend/recommend_index.dart';
import 'package:flutter/material.dart';

class TabIndexWidget extends StatefulWidget {
  const TabIndexWidget({super.key});

  @override
  State<TabIndexWidget> createState() => _TabIndexWidgetState();
}

class _TabIndexWidgetState extends State<TabIndexWidget>
    with SingleTickerProviderStateMixin {
  // static const List<BottomNavigationBarItem> myTabs = [
  //   BottomNavigationBarItem(icon: Icon(Icons.recommend), label: "推荐"),
  //   BottomNavigationBarItem(icon: Icon(Icons.list), label: "排行榜"),
  //   BottomNavigationBarItem(icon: Icon(Icons.breakfast_dining), label: "吃什么"),
  //   BottomNavigationBarItem(icon: Icon(Icons.headphones), label: "我的"),
  // ];
  static const List<Tab> myTabs = [
    Tab(text: "推荐", icon: Icon(Icons.recommend)),
    Tab(icon: Icon(Icons.list), text: "排行榜"),
    Tab(icon: Icon(Icons.breakfast_dining), text: "吃什么"),
    Tab(icon: Icon(Icons.headphones), text: "我的"),
  ];
  static const List<Widget> myControllers = [
    RecommendIndexWidget(),
    RankIndexWidget(),
    EatIndexWidget(),
    MineIndexWidget()
  ];
  late PageController _pageController;
  late TabController _tabController;
  int _selected = 0;

  @override
  void initState() {
    _pageController = PageController();
    _tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("食物杰"),
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          splashFactory: NoSplash.splashFactory,
          physics: const NeverScrollableScrollPhysics(),
          enableFeedback: false,
          indicator: const BoxDecoration(),
          tabs: myTabs,
          onTap: (value) {
            setState(() {
              _selected = value;
              _pageController.jumpToPage(value);
            });
          },
        ),
      ),
      // bottomNavigationBar: TabBar(
      //   items: myTabs,
      //   enableFeedback: false,
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: _selectedIndex,
      //   unselectedItemColor: Colors.grey,
      //   selectedItemColor: Colors.pink,
      //   onTap: (value) {
      //     setState(() {
      //       _selectedIndex = value;
      //     });
      //   },
      // ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: myControllers,
      ),
    );
  }
}
