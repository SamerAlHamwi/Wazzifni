



import 'package:wazzifni/core/boilerplate/api/data_source/model.dart';
import 'package:wazzifni/core/common/models/attachment_model.dart';
import 'package:wazzifni/core/common/models/translations_model.dart';
import 'package:wazzifni/features/user/auth/complete_account/data/model/award_model.dart';
import 'package:wazzifni/features/user/auth/complete_account/data/model/education_model.dart';
import 'package:wazzifni/features/user/auth/complete_account/data/model/work_experiences_model.dart';
import 'package:wazzifni/features/user/auth/login/data/model/cities_response.dart';

import '../../../../../../core/boilerplate/responses/ApiResponse.dart';


class UserProfileResponse extends ApiResponse<UserProfileModel> {
  UserProfileResponse({super.errors, required bool super.success, required super.data});
  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
        errors: json['error'], data: UserProfileModel.fromJson(json['result']), success: json['success']);
  }
}

class UserProfileModel extends BaseModel {
  int? id;
  String? about;
  CityModel? city;
  UserModel? user;
  List<EducationModel>? educations;
  List<WorkExperiencesModel>? workExperiences;
  List<AwardModel>? awards;
  List<SpokenLanguages>? spokenLanguages;
  List<Skills>? skills;
  Attachments? image;
  Attachments? cv;

  UserProfileModel({
    this.id,
    this.about,
    this.city,
    this.user,
    this.educations,
    this.workExperiences,
    this.awards,
    this.spokenLanguages,
    this.skills,
    this.image,
    this.cv,
  });

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    about = json['about'] as String?;
    city = (json['city'] as Map<String,dynamic>?) != null ? CityModel.fromJson(json['city'] as Map<String,dynamic>) : null;
    user = (json['user'] as Map<String,dynamic>?) != null ? UserModel.fromJson(json['user'] as Map<String,dynamic>) : null;
    educations = (json['educations'] as List?)?.map((dynamic e) => EducationModel.fromJson(e as Map<String,dynamic>)).toList();
    workExperiences = (json['workExperiences'] as List?)?.map((dynamic e) => WorkExperiencesModel.fromJson(e as Map<String,dynamic>)).toList();
    awards = (json['awards'] as List?)?.map((dynamic e) => AwardModel.fromJson(e as Map<String,dynamic>)).toList();
    spokenLanguages = (json['spokenLanguages'] as List?)?.map((dynamic e) => SpokenLanguages.fromJson(e as Map<String,dynamic>)).toList();
    skills = (json['skills'] as List?)?.map((dynamic e) => Skills.fromJson(e as Map<String,dynamic>)).toList();
    image = (json['image'] as Map<String,dynamic>?) != null ? Attachments.fromJson(json['image'] as Map<String,dynamic>) : null;
    cv = (json['cv'] as Map<String,dynamic>?) != null ? Attachments.fromJson(json['cv'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['about'] = about;
    json['city'] = city?.toJson();
    json['user'] = user?.toJson();
    json['educations'] = educations?.map((e) => e.toJson()).toList();
    json['workExperiences'] = workExperiences?.map((e) => e.toJson()).toList();
    json['awards'] = awards?.map((e) => e.toJson()).toList();
    json['spokenLanguages'] = spokenLanguages?.map((e) => e.toJson()).toList();
    json['skills'] = skills?.map((e) => e.toJson()).toList();
    json['image'] = image?.toJson();
    json['cv'] = cv?.toJson();
    return json;
  }
}


class UserModel extends BaseModel {
  int? id;
  String? userName;
  String? name;
  String? surname;
  bool? isActive;
  String? fullName;
  String? dialCode;
  String? phoneNumber;
  int? type;

  UserModel({
    this.id,
    this.userName,
    this.name,
    this.surname,
    this.isActive,
    this.fullName,
    this.dialCode,
    this.phoneNumber,
    this.type,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    userName = json['userName'] as String?;
    name = json['name'] as String?;
    surname = json['surname'] as String?;
    isActive = json['isActive'] as bool?;
    fullName = json['fullName'] as String?;
    dialCode = json['dialCode'] as String?;
    phoneNumber = json['phoneNumber'] as String?;
    type = json['type'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['userName'] = userName;
    json['name'] = name;
    json['surname'] = surname;
    json['isActive'] = isActive;
    json['fullName'] = fullName;
    json['dialCode'] = dialCode;
    json['phoneNumber'] = phoneNumber;
    json['type'] = type;
    return json;
  }
}

class SpokenLanguages extends BaseModel {
  SpokenLanguage? spokenLanguage;
  int? oralLevel;
  int? writingLevel;
  bool? isNative;

  SpokenLanguages({
    this.spokenLanguage,
    this.oralLevel,
    this.writingLevel,
    this.isNative,
  });

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    spokenLanguage = (json['spokenLanguage'] as Map<String,dynamic>?) != null ? SpokenLanguage.fromJson(json['spokenLanguage'] as Map<String,dynamic>) : null;
    oralLevel = json['oralLevel'] as int?;
    writingLevel = json['writingLevel'] as int?;
    isNative = json['isNative'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['spokenLanguage'] = spokenLanguage?.toJson();
    json['oralLevel'] = oralLevel;
    json['writingLevel'] = writingLevel;
    json['isNative'] = isNative;
    return json;
  }
}

class SpokenLanguage extends BaseModel {
  int? id;
  String? name;
  String? displayName;

  SpokenLanguage({
    this.id,
    this.name,
    this.displayName,
  });

  SpokenLanguage.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    displayName = json['displayName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['displayName'] = displayName;
    return json;
  }
}

class Skills extends BaseModel {
  int? id;
  List<Translations>? translations;
  String? name;
  bool? isActive;

  Skills({
    this.id,
    this.translations,
    this.name,
    this.isActive,
  });

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    translations = (json['translations'] as List?)?.map((dynamic e) => Translations.fromJson(e as Map<String,dynamic>)).toList();
    name = json['name'] as String?;
    isActive = json['isActive'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['translations'] = translations?.map((e) => e.toJson()).toList();
    json['name'] = name;
    json['isActive'] = isActive;
    return json;
  }
}
