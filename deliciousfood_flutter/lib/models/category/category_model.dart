import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String? id;
  String? title;
  @JsonKey(name: "icon_selected")
  String? iconSelected;
  @JsonKey(name: "sub_cates")
  List<CategorySubCateModel>? subCates;

  CategoryModel({
    this.id,
    this.title,
    this.iconSelected,
    this.subCates,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategorySubCateModel {
  String? id;
  String? title;
  int? type;

  CategorySubCateModel({
    this.id,
    this.title,
    this.type,
  });

  factory CategorySubCateModel.fromJson(Map<String, dynamic> json) =>
      _$CategorySubCateModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategorySubCateModelToJson(this);
}
