import 'package:json_annotation/json_annotation.dart';

part 'home_recommend_zhuanti_model.g.dart';

@JsonSerializable()
class HomeRecommendZhuantiModel {
  String? img;

  HomeRecommendZhuantiJumpModel? jump;

  String? title;

  String? type;

  HomeRecommendZhuantiModel(
    this.img,
    this.jump,
    this.title,
    this.type,
  );

  factory HomeRecommendZhuantiModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeRecommendZhuantiModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeRecommendZhuantiModelToJson(this);
}

@JsonSerializable()
class HomeRecommendZhuantiJumpModel {
  @JsonKey(name: 'is_check_login')
  String? isCheckLogin;

  HomeRecommendZhuantiJumpPropertyModel? property;

  @JsonKey(name: 'type')
  String? type;

  HomeRecommendZhuantiJumpModel(
    this.isCheckLogin,
    this.property,
    this.type,
  );

  factory HomeRecommendZhuantiJumpModel.fromJson(
          Map<String, dynamic> srcJson) =>
      _$HomeRecommendZhuantiJumpModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeRecommendZhuantiJumpModelToJson(this);
}

@JsonSerializable()
class HomeRecommendZhuantiJumpPropertyModel {
  String? ztId;

  String? ztUrl;

  HomeRecommendZhuantiJumpPropertyModel(
    this.ztId,
    this.ztUrl,
  );

  factory HomeRecommendZhuantiJumpPropertyModel.fromJson(
          Map<String, dynamic> srcJson) =>
      _$HomeRecommendZhuantiJumpPropertyModelFromJson(srcJson);

  Map<String, dynamic> toJson() =>
      _$HomeRecommendZhuantiJumpPropertyModelToJson(this);
}
