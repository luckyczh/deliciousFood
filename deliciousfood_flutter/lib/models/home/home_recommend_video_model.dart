import 'package:json_annotation/json_annotation.dart';

part 'home_recommend_video_model.g.dart';

@JsonSerializable()
class HomeRecommendVideoInfoModel {
  @JsonKey(name: 'author')
  HomeRecommendVideoInfoAuthorModel? author;

  @JsonKey(name: 'date')
  String? date;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'jump')
  String? jump;

  @JsonKey(name: 'recommend_title')
  String? recommendTitle;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'vendor_video')
  String? vendorVideo;

  @JsonKey(name: 'video')
  HomeRecommendVideoModel? video;

  HomeRecommendVideoInfoModel(
    this.author,
    this.date,
    this.id,
    this.jump,
    this.recommendTitle,
    this.title,
    this.vendorVideo,
    this.video,
  );

  factory HomeRecommendVideoInfoModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeRecommendVideoInfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeRecommendVideoInfoModelToJson(this);
}

@JsonSerializable()
class HomeRecommendVideoModel {
  String? img;

  @JsonKey(name: 'img_test')
  String? imgTest;

  @JsonKey(name: 'vendor_video')
  String? vendorVideo;
  HomeRecommendVideoModel(
    this.img,
    this.imgTest,
    this.vendorVideo,
  );

  factory HomeRecommendVideoModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeRecommendVideoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeRecommendVideoModelToJson(this);
}

@JsonSerializable()
class HomeRecommendVideoInfoAuthorModel {
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;

  String? id;

  String? nickname;

  HomeRecommendVideoInfoAuthorModel(
    this.avatarUrl,
    this.id,
    this.nickname,
  );

  factory HomeRecommendVideoInfoAuthorModel.fromJson(
          Map<String, dynamic> srcJson) =>
      _$HomeRecommendVideoInfoAuthorModelFromJson(srcJson);

  Map<String, dynamic> toJson() =>
      _$HomeRecommendVideoInfoAuthorModelToJson(this);
}
