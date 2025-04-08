// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobModelImpl _$$JobModelImplFromJson(Map<String, dynamic> json) =>
    _$JobModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      companyName: json['company_name'] as String,
      candidateRequiredLocation: json['candidate_required_location'] as String,
      description: json['description'] as String,
      salary: json['salary'] as String,
      publicationDate: json['publication_date'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$JobModelImplToJson(_$JobModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'company_name': instance.companyName,
      'candidate_required_location': instance.candidateRequiredLocation,
      'description': instance.description,
      'salary': instance.salary,
      'publication_date': instance.publicationDate,
      'url': instance.url,
    };
