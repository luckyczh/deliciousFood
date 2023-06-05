// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeFeedArticleModel _$HomeFeedArticleModelFromJson(
        Map<String, dynamic> json) =>
    HomeFeedArticleModel(
      id: json['id'] as String?,
      isVideo: json['isVideo'] as String?,
      viewedAmount: json['viewed_amount'] as String?,
      title: json['title'] as String?,
      img: json['img'] as String?,
      url: json['url'] as String?,
      author: json['author'] == null
          ? null
          : HomeRecommendVideoInfoAuthorModel.fromJson(
              json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeFeedArticleModelToJson(
        HomeFeedArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isVideo': instance.isVideo,
      'viewed_amount': instance.viewedAmount,
      'title': instance.title,
      'img': instance.img,
      'url': instance.url,
      'author': instance.author,
    };
