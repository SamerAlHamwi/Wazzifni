

import '../../../../../../core/boilerplate/api/data_source/model.dart';
import '../../../../../../core/boilerplate/responses/ApiResponse.dart';


class CreateUserResponse extends ApiResponse<CreateUserModel> {
  CreateUserResponse({super.errors, required bool super.success, required super.data});
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
        errors: json['error'], data: CreateUserModel.fromJson(json['result']), success: json['success']);
  }
}

class CreateUserModel extends BaseModel {
  String? accessToken;
  int? userId;
  String? userName;
  int? userType;
  int? companyId;
  int? profileId;

  CreateUserModel({
    this.accessToken,
    this.userId,
    this.userName,
    this.userType,
    this.companyId,
    this.profileId,
  });

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    userId = json['userId'];
    userName = json['userName'];
    userType = json['userType'];
    profileId = json['profileId'];
    companyId = json['companyId'];
  }
}

