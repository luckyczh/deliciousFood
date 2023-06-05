// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_recommend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRecommendModel _$HomeRecommendModelFromJson(Map<String, dynamic> json) =>
    HomeRecommendModel(
      (json['channel'] as List<dynamic>?)
          ?.map((e) =>
              HomeRecommendChannelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['jieqi_sc'] == null
          ? null
          : HomeRecommendJieqiscModel.fromJson(
              json['jieqi_sc'] as Map<String, dynamic>),
      json['recommend_info'] == null
          ? null
          : HomeRecommendInfoModel.fromJson(
              json['recommend_info'] as Map<String, dynamic>),
      (json['sancan'] as List<dynamic>?)
          ?.map((e) => HomeRecommendModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['title'] as String,
      json['type'] as String,
      (json['video_info'] as List<dynamic>?)
          ?.map((e) =>
              HomeRecommendVideoInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['zhuanti'] as List<dynamic>?)
          ?.map((e) =>
              HomeRecommendZhuantiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..items = (json['items'] as List<dynamic>?)
        ?.map(
            (e) => HomeRecommendSancanModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$HomeRecommendModelToJson(HomeRecommendModel instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'jieqi_sc': instance.jieqiSc,
      'recommend_info': instance.recommendInfo,
      'sancan': instance.sancan,
      'items': instance.items,
      'title': instance.title,
      'type': instance.type,
      'video_info': instance.videoInfo,
      'zhuanti': instance.zhuanti,
    };

HomeRecommendInfoModel _$HomeRecommendInfoModelFromJson(
        Map<String, dynamic> json) =>
    HomeRecommendInfoModel(
      json['recommend_text'] as String,
    );

Map<String, dynamic> _$HomeRecommendInfoModelToJson(
        HomeRecommendInfoModel instance) =>
    <String, dynamic>{
      'recommend_text': instance.recommendText,
    };
