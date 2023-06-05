import 'package:json_annotation/json_annotation.dart';

import 'home_recommend_video_model.dart';

part 'home_feed_recipe_model.g.dart';

@JsonSerializable()
class HomeFeedRecipeModel {
  String? id;
  String? title;
  String? img;
  @JsonKey(name: "favor_amount")
  String? favorAmount;
  @JsonKey(name: "viewed_amount")
  String? viewedAmount;
  String? rate;
  List<String>? shicai;
  HomeRecommendVideoInfoAuthorModel? author;
  @JsonKey(name: "rand_num")
  int? randNum;
  List<HomeFeedRecipeLableModel>? label;

  HomeFeedRecipeModel({
    this.id,
    this.title,
    this.img,
    this.favorAmount,
    this.viewedAmount,
    this.rate,
    this.shicai,
    this.author,
    this.randNum,
    this.label,
  });

  factory HomeFeedRecipeModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeFeedRecipeModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeFeedRecipeModelToJson(this);
}

@JsonSerializable()
class HomeFeedRecipeLableModel {
  String? name;
  String? desc;
  String? pic;

  HomeFeedRecipeLableModel({this.name, this.desc, this.pic});

  factory HomeFeedRecipeLableModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeFeedRecipeLableModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeFeedRecipeLableModelToJson(this);
}
