// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: '${json['id']}',
      title: json['title'] as String?,
      iconSelected: json['icon_selected'] as String?,
      subCates: (json['sub_cates'] as List<dynamic>?)
          ?.map((e) => CategorySubCateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon_selected': instance.iconSelected,
      'sub_cates': instance.subCates,
    };

CategorySubCateModel _$CategorySubCateModelFromJson(
        Map<String, dynamic> json) =>
    CategorySubCateModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$CategorySubCateModelToJson(
        CategorySubCateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
    };
