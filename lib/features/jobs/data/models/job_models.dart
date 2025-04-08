import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_models.freezed.dart';
part 'job_models.g.dart';

@freezed
class JobModel with _$JobModel {
  const factory JobModel({
    required int id,
    required String title,
    @JsonKey(name: 'company_name') required String companyName,
    @JsonKey(name: 'candidate_required_location') required String candidateRequiredLocation,
    required String description,
    required String salary,
    @JsonKey(name: 'publication_date') required String publicationDate,
    required String url,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
}
