// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_caidan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeFeedCaidanModel _$HomeFeedCaidanModelFromJson(Map<String, dynamic> json) =>
    HomeFeedCaidanModel(
      id: json['id'] as String?,
      totalAmount: json['total_amount'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      author: json['author'] == null
          ? null
          : HomeRecommendVideoInfoAuthorModel.fromJson(
              json['author'] as Map<String, dynamic>),
      img: (json['img'] as List<dynamic>?)?.map((e) => e as String).toList(),
      randNum: (json['rand_num'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HomeFeedCaidanModelToJson(
        HomeFeedCaidanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_amount': instance.totalAmount,
      'title': instance.title,
      'desc': instance.desc,
      'author': instance.author,
      'img': instance.img,
      'rand_num': instance.randNum,
    };
