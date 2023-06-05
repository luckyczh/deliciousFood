import 'package:deliciousfood_flutter/models/home/home_recommend_video_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_feed_article_model.g.dart';

@JsonSerializable()
class HomeFeedArticleModel {
  String? id;
  String? isVideo;
  @JsonKey(name: "viewed_amount")
  String? viewedAmount;
  String? title;
  String? img;
  String? url;
  HomeRecommendVideoInfoAuthorModel? author;

  HomeFeedArticleModel({
    this.id,
    this.isVideo,
    this.viewedAmount,
    this.title,
    this.img,
    this.url,
    this.author,
  });

  factory HomeFeedArticleModel.fromJson(Map<String, dynamic> json) =>
      _$HomeFeedArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeFeedArticleModelToJson(this);
}
