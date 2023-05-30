// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_recommend_jieqisc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRecommendJieqiscModel _$HomeRecommendJieqiscModelFromJson(
        Map<String, dynamic> json) =>
    HomeRecommendJieqiscModel(
      json['banner'] == null
          ? null
          : HomeRecommendBannerModel.fromJson(
              json['banner'] as Map<String, dynamic>),
      json['corner_img'] as String?,
      json['jq_text'] as String?,
      json['jq_time'] as String?,
      (json['jq_tips'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['jq_title'] as String?,
      (json['sc_list'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['zt_id'] as String?,
    );

Map<String, dynamic> _$HomeRecommendJieqiscModelToJson(
        HomeRecommendJieqiscModel instance) =>
    <String, dynamic>{
      'banner': instance.banner,
      'corner_img': instance.cornerImg,
      'jq_text': instance.jqText,
      'jq_time': instance.jqTime,
      'jq_tips': instance.jqTips,
      'jq_title': instance.jqTitle,
      'sc_list': instance.scList,
      'zt_id': instance.ztId,
    };
