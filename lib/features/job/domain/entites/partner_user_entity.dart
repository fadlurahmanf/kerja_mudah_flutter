import 'package:json_annotation/json_annotation.dart';

part 'partner_user_entity.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class PartnerUserEntity{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'photo_url')
  String? photoUrl;

  PartnerUserEntity({this.id, this.name, this.photoUrl});

  factory PartnerUserEntity.fromJson(Map<String, dynamic> json) => _$PartnerUserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerUserEntityToJson(this);
}