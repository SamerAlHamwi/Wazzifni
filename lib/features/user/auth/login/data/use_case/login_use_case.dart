



import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../model/login_response.dart';
import '../repository/auth_repository.dart';

class LoginParams extends BaseParams {
  LoginParams({
    this.dialCode,
    this.phoneNumber,
    this.language,
    this.userType
  });
  final String? dialCode;
  final String? phoneNumber;
  final String? language;
  final int? userType;

  toJson() {
    Map<String, dynamic> queryParams = {};
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
