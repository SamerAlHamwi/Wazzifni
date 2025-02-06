

import 'package:wazzifni/core/boilerplate/api/data_source/model.dart';

class WorkExperiencesModel extends BaseModel {
  String? jobTitle;
  String? companyName;
  DateTime? startDate;
  DateTime? endDate;
  bool? isCurrentJob;
  String? description;

  WorkExperiencesModel({
    this.jobTitle,
    this.companyName,
    this.startDate,
    this.endDate,
    this.isCurrentJob,
    this.description,
  });

  WorkExperiencesModel.fromJson(Map<String, dynamic> json) {
    jobTitle = json['jobTitle'] as String?;
    companyName = json['companyName'] as String?;
    startDate = DateTime.parse(json['startDate']);
    endDate = DateTime.parse(json['endDate']);
    isCurrentJob = json['isCurrentJob'] as bool?;
    description = json['description'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['jobTitle'] = jobTitle;
    json['companyName'] = companyName;
    json['startDate'] = startDate!.toIso8601String();
    json['endDate'] = endDate!.toIso8601String();
    json['isCurrentJob'] = isCurrentJob;
    json['description'] = description;
    return json;
  }
}