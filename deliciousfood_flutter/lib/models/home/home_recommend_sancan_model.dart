import 'package:json_annotation/json_annotation.dart';

part 'home_recommend_sancan_model.g.dart';

@JsonSerializable()
class HomeRecommendSancanModel {
  String? desc;

  String? id;

  String? img;

  @JsonKey(name: 'recipe_type')
  String? recipeType;

  String? title;

  HomeRecommendSancanModel(
    this.desc,
    this.id,
    this.img,
    this.recipeType,
    this.title,
  );

  factory HomeRecommendSancanModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeRecommendSancanModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeRecommendSancanModelToJson(this);
}
