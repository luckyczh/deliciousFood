import 'package:deliciousfood_flutter/pages/eat/eat_index.dart';
import 'package:deliciousfood_flutter/pages/login/login_page.dart';
import 'package:deliciousfood_flutter/pages/mine/mine_index.dart';
import 'package:deliciousfood_flutter/pages/rank/rank_index.dart';
import 'package:deliciousfood_flutter/pages/recommend/recommend_index.dart';
import 'package:deliciousfood_flutter/pages/tab_index.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const TabIndexWidget(),
  '/rank': (context) => const RankIndexWidget(),
  '/recommend': (context) => const RecommendIndexWidget(),
  '/eat': (context) => const EatIndexWidget(),
  '/mine': (context) => const MineIndexWidget(),
  '/login': (context) => const LoginPage(),
};
