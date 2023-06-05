import 'package:deliciousfood_flutter/models/home/home_feed_article_model.dart';
import 'package:deliciousfood_flutter/models/home/home_feed_caidan_model.dart';
import 'package:deliciousfood_flutter/models/home/home_feed_recipe_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'home_feed_sceneclass_model.dart';

part 'home_feed_model.g.dart';

@JsonSerializable()
class HomeFeedModel {
  String? type;
  String? tag;
  @JsonKey(name: "wh_ratio")
  dynamic whRatio;
  HomeFeedRecipeModel? recipe;
  @JsonKey(name: "hot_search")
  List<HomeFeedRecipeLableModel>? hotSearch;
  HomeFeedCaidanModel? caidan;
  @JsonKey(name: "video_recipe")
  HomeFeedRecipeModel? videoRecipe;
  @JsonKey(name: "scene_class")
  HomeFeedSceneClassModel? sceneClass;
  HomeFeedArticleModel? article;

  HomeFeedModel({
    this.type,
    this.tag,
    this.whRatio,
    this.recipe,
    this.hotSearch,
    this.caidan,
    this.videoRecipe,
    this.sceneClass,
    this.article,
  });

  factory HomeFeedModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeFeedModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeFeedModelToJson(this);
}
