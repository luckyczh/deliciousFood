import 'package:deliciousfood_flutter/models/category/category_model.dart';
import 'package:deliciousfood_flutter/models/eat/eat_question_model.dart';
import 'package:deliciousfood_flutter/models/home/home_feed_model.dart';
import 'package:deliciousfood_flutter/models/mine/person_model.dart';

import '../../../models/home/home_recommend_model.dart';
import '../base/api.dart';
import '../base/client.dart';

extension HomeClient on Client {
  /// 获取首页推荐数据
  Future<List<HomeRecommendModel>> getHomeRecommendData() async {
    final result = await fetch(Api.homeRecommend);
    if (result == null) {
      return [];
    }
    return (result as List)
        .map((e) => HomeRecommendModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// 获取首页feed数据
  Future<List<HomeFeedModel>> getHomeFeedData({int page = 1}) async {
    final result = await fetch(Api.homeFeed, parameter: {"page": page});
    if (result == null) {
      return [];
    }
    final list = (result["items"] as List)
        .map((e) => HomeFeedModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }

  /// 获取排行榜列表
  Future<List<HomeFeedModel>> getRankList({int page = 1}) async {
    final result = await fetch(Api.rankList, parameter: {"page": page});
    if (result == null) {
      return [];
    }
    final list = (result["items"] as List)
        .map((e) => HomeFeedModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }

  /// 菜谱分类
  Future<List<CategoryModel>> getCategories() async {
    final result = await fetch(Api.recipeCategory);
    if (result == null) {
      return [];
    }
    return (result as List).map((e) => CategoryModel.fromJson(e)).toList();
  }

  /// 吃什么列表
  Future<List<EatQuestionModel>> getEatList() async {
    final result = await fetch(Api.eatList);
    if (result == null) {
      return [];
    }
    return (result as List).map((e) => EatQuestionModel.fromJson(e)).toList();
  }

  /// 用户信息
  Future<PersonModel> getUerInfo() async {
    final result = await fetch(Api.personInfo);
    if (result == null) {
      return PersonModel(null, null);
    }
    return PersonModel.fromJson(result);
  }
}
