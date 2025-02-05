



import 'package:wazzifni/core/boilerplate/api/data_source/model.dart';

import '../../../../../../core/boilerplate/responses/ApiResponse.dart';
import '../../../../../../core/common/models/attachment_model.dart';
import '../../../../../../core/common/models/translations_model.dart';
import '../../../../../../core/common/models/user_model.dart';
import '../../../../../user/auth/login/data/model/cities_response.dart';


class CreateCompanyResponse extends ApiResponse<CompanyModel> {
  CreateCompanyResponse({super.errors, required bool super.success, required super.data});
  factory CreateCompanyResponse.fromJson(Map<String, dynamic> json) {
    return CreateCompanyResponse(
        errors: json['error'], data: CompanyModel.fromJson(json['result']), success: json['success']);
  }
}


class CompanyModel extends BaseModel {
  int? id;
  String? name;
  String? about;
  List<Translations>? translations;
  String? address;
  CityModel? city;
  User? user;
  bool? isActive;
  int? status;
  String? jobType;
  String? dateOfEstablishment;
  String? reasonRefuse;
  int? numberOfEmployees;
  Attachments? companyProfile;
  List<Attachments>? attachments;
  Attachments? profile;

  CompanyModel({
    this.id,
    this.name,
    this.about,
    this.translations,
    this.address,
    this.city,
    this.user,
    this.isActive,
    this.status,
    this.jobType,
    this.dateOfEstablishment,
    this.reasonRefuse,
    this.numberOfEmployees,
    this.companyProfile,
    this.attachments,
    this.profile,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    about = json['about'] as String?;
    translations = (json['translations'] as List?)?.map((dynamic e) => Translations.fromJson(e as Map<String,dynamic>)).toList();
    address = json['address'] as String?;
    city = (json['city'] as Map<String,dynamic>?) != null ? CityModel.fromJson(json['city'] as Map<String,dynamic>) : null;
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
    isActive = json['isActive'] as bool?;
    status = json['status'] as int?;
    jobType = json['jobType'] as String?;
    dateOfEstablishment = json['dateOfEstablishment'] as String?;
    reasonRefuse = json['reasonRefuse'] as String?;
    numberOfEmployees = json['numberOfEmployees'] as int?;
    companyProfile = (json['companyProfile'] as Map<String,dynamic>?) != null ? Attachments.fromJson(json['companyProfile'] as Map<String,dynamic>) : null;
    attachments = (json['attachments'] as List?)?.map((dynamic e) => Attachments.fromJson(e as Map<String,dynamic>)).toList();
    profile = (json['profile'] as Map<String,dynamic>?) != null ? Attachments.fromJson(json['profile'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['about'] = about;
    json['translations'] = translations?.map((e) => e.toJson()).toList();
    json['address'] = address;
    json['city'] = city?.toJson();
    json['user'] = user?.toJson();
    json['isActive'] = isActive;
    json['status'] = status;
    json['jobType'] = jobType;
    json['dateOfEstablishment'] = dateOfEstablishment;
    json['reasonRefuse'] = reasonRefuse;
    json['numberOfEmployees'] = numberOfEmployees;
    json['companyProfile'] = companyProfile?.toJson();
    json['attachments'] = attachments?.map((e) => e.toJson()).toList();
    json['profile'] = profile?.toJson();
    return json;
  }
}
