

import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../model/login_response.dart';
import '../repository/auth_repository.dart';

class LoginParams extends BaseParams {

  LoginParams({
    this.fullName,
    this.email,
    this.dialCode,
    this.phoneNumber,
    this.language,
    this.code,
    this.cityId,
    this.userType,
  });

  final String? fullName;
  final String? email;
  final String? dialCode;
  final String? phoneNumber;
  final String? language;
  final String? code;
  final int? userType;
  late int? cityId;


  LoginParams copyWith({
    String? fullName,
    String? email,
    String? dialCode,
    String? phoneNumber,
    String? language,
    String? code,
    int? userType,
    int? cityId,
  }) {
    return LoginParams(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      dialCode: dialCode ?? this.dialCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      language: language ?? this.language,
      code: code ?? this.code,
      userType: userType ?? this.userType,
      cityId: cityId ?? this.cityId,
    );
  }

  toJson() {
    Map<String, dynamic> queryParams = {};
    if (fullName != null) {
      queryParams.putIfAbsent("fullName", () => fullName);
    }
    if (email != null) {
      queryParams.putIfAbsent("email", () => email);
    }
    if (dialCode != null) {
      queryParams.putIfAbsent("dialCode", () => dialCode);
    }
    if (phoneNumber != null) {
      queryParams.putIfAbsent("phoneNumber", () => phoneNumber);
    }
    if(language != null){
      queryParams.putIfAbsent("language", () => language);
    }
    if(userType != null){
      queryParams.putIfAbsent("userType", () => userType);
    }
    if(code != null){
      queryParams.putIfAbsent("code", () => code);
    }
    if(cityId != null){
      queryParams.putIfAbsent("cityId", () => cityId);
    }

    return queryParams;
  }
}

class LoginUseCase extends UseCase<LoginModel, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Result<LoginModel>> call({required LoginParams params}) {
    return repository.login(params: params);
  }
}
