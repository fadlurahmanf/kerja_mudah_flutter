import 'package:json_annotation/json_annotation.dart';
import 'package:kerja_mudah/features/job/domain/entites/job_category_entity.dart';
import 'package:kerja_mudah/features/job/domain/entites/partner_user_entity.dart';

part 'job_entity.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class JobEntity{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'total_salary')
  double? totalSalary;
  @JsonKey(name: 'salary_per_hour')
  double? salaryPerHour;
  @JsonKey(name: 'category')
  JobCategoryEntity? category;
  @JsonKey(name: 'partner_user')
  PartnerUserEntity? partnerUser;

  JobEntity({this.id, this.title, this.totalSalary, this.salaryPerHour, this.category, this.partnerUser});

  factory JobEntity.fromJson(Map<String, dynamic> json) => _$JobEntityFromJson(json);

  Map<String, dynamic> toJson() => _$JobEntityToJson(this);
}