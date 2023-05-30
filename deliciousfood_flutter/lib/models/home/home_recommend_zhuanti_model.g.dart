// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_recommend_zhuanti_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRecommendZhuantiModel _$HomeRecommendZhuantiModelFromJson(
        Map<String, dynamic> json) =>
    HomeRecommendZhuantiModel(
      json['img'] as String?,
      json['jump'] == null
          ? null
          : HomeRecommendZhuantiJumpModel.fromJson(
              json['jump'] as Map<String, dynamic>),
      json['title'] as String?,
      json['type'] as String?,
    );

Map<String, dynamic> _$HomeRecommendZhuantiModelToJson(
        HomeRecommendZhuantiModel instance) =>
    <String, dynamic>{
      'img': instance.img,
      'jump': instance.jump,
      'title': instance.title,
      'type': instance.type,
    };

HomeRecommendZhuantiJumpModel _$HomeRecommendZhuantiJumpModelFromJson(
        Map<String, dynamic> json) =>
    HomeRecommendZhuantiJumpModel(
      json['is_check_login'] as String?,
      json['property'] == null
          ? null
          : HomeRecommendZhuantiJumpPropertyModel.fromJson(
              json['property'] as Map<String, dynamic>),
      json['type'] as String?,
    );

Map<String, dynamic> _$HomeRecommendZhuantiJumpModelToJson(
        HomeRecommendZhuantiJumpModel instance) =>
    <String, dynamic>{
      'is_check_login': instance.isCheckLogin,
      'property': instance.property,
      'type': instance.type,
    };

HomeRecommendZhuantiJumpPropertyModel
    _$HomeRecommendZhuantiJumpPropertyModelFromJson(
            Map<String, dynamic> json) =>
        HomeRecommendZhuantiJumpPropertyModel(
          json['ztId'] as String?,
          json['ztUrl'] as String?,
        );

Map<String, dynamic> _$HomeRecommendZhuantiJumpPropertyModelToJson(
        HomeRecommendZhuantiJumpPropertyModel instance) =>
    <String, dynamic>{
      'ztId': instance.ztId,
      'ztUrl': instance.ztUrl,
    };
