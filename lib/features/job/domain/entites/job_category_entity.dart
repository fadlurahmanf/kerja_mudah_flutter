import 'package:json_annotation/json_annotation.dart';

part 'job_category_entity.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class JobCategoryEntity{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'type')
  String? type;

  JobCategoryEntity({this.id, this.type});

  factory JobCategoryEntity.fromJson(Map<String, dynamic> json) => _$JobCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$JobCategoryEntityToJson(this);
}