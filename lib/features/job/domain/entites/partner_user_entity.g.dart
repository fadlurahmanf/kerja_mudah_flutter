// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerUserEntity _$PartnerUserEntityFromJson(Map json) => PartnerUserEntity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      photoUrl: json['photo_url'] as String?,
    );

Map<String, dynamic> _$PartnerUserEntityToJson(PartnerUserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo_url': instance.photoUrl,
    };
