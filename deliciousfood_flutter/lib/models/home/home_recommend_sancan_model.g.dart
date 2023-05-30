// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_recommend_sancan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRecommendSancanModel _$HomeRecommendSancanModelFromJson(
        Map<String, dynamic> json) =>
    HomeRecommendSancanModel(
      json['desc'] as String?,
      json['id'] as String?,
      json['img'] as String?,
      json['recipe_type'] as String?,
      json['title'] as String?,
    );

Map<String, dynamic> _$HomeRecommendSancanModelToJson(
        HomeRecommendSancanModel instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'img': instance.img,
      'recipe_type': instance.recipeType,
      'title': instance.title,
    };
