


import '../../../../../../core/boilerplate/api/data_source/model.dart';
import '../../../../../../core/boilerplate/responses/ApiResponse.dart';


class LoginResponse extends ApiResponse<LoginModel> {
  LoginResponse({super.errors, required bool super.success, required super.data});
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        errors: json['error'], data: LoginModel.fromJson(json['result']), success: json['success']);
  }
}

class LoginModel extends BaseModel {
  String? code;

  LoginModel({this.code});

  LoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['code'] = code;
    return data;
  }
}
