// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_recommend_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRecommendVideoInfoModel _$HomeRecommendVideoInfoModelFromJson(
        Map<String, dynamic> json) =>
    HomeRecommendVideoInfoModel(
      json['author'] == null
          ? null
          : HomeRecommendVideoInfoAuthorModel.fromJson(
              json['author'] as Map<String, dynamic>),
      json['date'] as String?,
      json['id'] as String?,
      json['jump'] as String?,
      json['recommend_title'] as String?,
      json['title'] as String?,
      json['vendor_video'] as String?,
      json['video'] == null
          ? null
          : HomeRecommendVideoModel.fromJson(
              json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeRecommendVideoInfoModelToJson(
        HomeRecommendVideoInfoModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'date': instance.date,
      'id': instance.id,
      'jump': instance.jump,
      'recommend_title': instance.recommendTitle,
      'title': instance.title,
      'vendor_video': instance.vendorVideo,
      'video': instance.video,
    };

HomeRecommendVideoModel _$HomeRecommendVideoModelFromJson(
        Map<String, dynamic> json) =>
    HomeRecommendVideoModel(
      json['img'] as String?,
      json['img_test'] as String?,
      json['vendor_video'] as String?,
    );

Map<String, dynamic> _$HomeRecommendVideoModelToJson(
        HomeRecommendVideoModel instance) =>
    <String, dynamic>{
      'img': instance.img,
      'img_test': instance.imgTest,
      'vendor_video': instance.vendorVideo,
    };

HomeRecommendVideoInfoAuthorModel _$HomeRecommendVideoInfoAuthorModelFromJson(
        Map<String, dynamic> json) =>
    HomeRecommendVideoInfoAuthorModel(
      json['avatar_url'] as String?,
      json['id'] as String?,
      json['nickname'] as String?,
    );

Map<String, dynamic> _$HomeRecommendVideoInfoAuthorModelToJson(
        HomeRecommendVideoInfoAuthorModel instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'id': instance.id,
      'nickname': instance.nickname,
    };
