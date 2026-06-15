import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemResponse {
  final String message;
  final List<ItemModel> data;

  const ItemResponse({required this.message, required this.data});

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemResponseToJson(this);
}

@JsonSerializable()
class ItemModel {
  final String id;

  @JsonKey(name: 'category_id')
  final String categoryId;

  final int priority;
  final String name;
  final String thumbnail;

  @JsonKey(name: 'thumbnail_small')
  final String thumbnailSmall;

  @JsonKey(name: 'thumbnail_medium')
  final String thumbnailMedium;

  final String photo;
  final bool status;

  @JsonKey(name: 'is_pro', defaultValue: false)
  final bool isPro;

  final int view;
  final int like;

  @JsonKey(name: 'custom_fields')
  final CustomFields customFields;

  const ItemModel({
    required this.id,
    required this.categoryId,
    required this.priority,
    required this.name,
    required this.thumbnail,
    required this.thumbnailSmall,
    required this.thumbnailMedium,
    required this.photo,
    required this.status,
    required this.isPro,
    required this.view,
    required this.like,
    required this.customFields,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}

@JsonSerializable()
class CustomFields {
  @JsonKey(name: 'categoryId')
  final String? categoryId;

  @JsonKey(name: 'imageUrl')
  final String? imageUrl;

  final String? preview;

  const CustomFields({this.categoryId, this.imageUrl, this.preview});

  factory CustomFields.fromJson(Map<String, dynamic> json) =>
      _$CustomFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$CustomFieldsToJson(this);
}
