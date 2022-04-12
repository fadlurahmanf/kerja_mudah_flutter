// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobEntity _$JobEntityFromJson(Map json) => JobEntity(
      id: json['id'] as int?,
      title: json['title'] as String?,
      totalSalary: (json['total_salary'] as num?)?.toDouble(),
      salaryPerHour: (json['salary_per_hour'] as num?)?.toDouble(),
      category: json['category'] == null
          ? null
          : JobCategoryEntity.fromJson(
              Map<String, dynamic>.from(json['category'] as Map)),
      partnerUser: json['partner_user'] == null
          ? null
          : PartnerUserEntity.fromJson(
              Map<String, dynamic>.from(json['partner_user'] as Map)),
    );

Map<String, dynamic> _$JobEntityToJson(JobEntity instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'total_salary': instance.totalSalary,
      'salary_per_hour': instance.salaryPerHour,
      'category': instance.category?.toJson(),
      'partner_user': instance.partnerUser?.toJson(),
    };
