// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) => ItemResponse(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemResponseToJson(ItemResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      priority: (json['priority'] as num).toInt(),
      name: json['name'] as String,
      thumbnail: json['thumbnail'] as String,
      thumbnailSmall: json['thumbnail_small'] as String,
      thumbnailMedium: json['thumbnail_medium'] as String,
      photo: json['photo'] as String,
      status: json['status'] as bool,
      isPro: json['is_pro'] as bool? ?? false,
      view: (json['view'] as num).toInt(),
      like: (json['like'] as num).toInt(),
      customFields:
          CustomFields.fromJson(json['custom_fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'priority': instance.priority,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'thumbnail_small': instance.thumbnailSmall,
      'thumbnail_medium': instance.thumbnailMedium,
      'photo': instance.photo,
      'status': instance.status,
      'is_pro': instance.isPro,
      'view': instance.view,
      'like': instance.like,
      'custom_fields': instance.customFields.toJson(),
    };

CustomFields _$CustomFieldsFromJson(Map<String, dynamic> json) => CustomFields(
      categoryId: json['categoryId'] as String?,
      imageUrl: json['imageUrl'] as String?,
      preview: json['preview'] as String?,
    );

Map<String, dynamic> _$CustomFieldsToJson(CustomFields instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'imageUrl': instance.imageUrl,
      'preview': instance.preview,
    };
