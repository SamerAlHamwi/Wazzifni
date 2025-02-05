


import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../model/login_response.dart';
import '../repository/auth_repository.dart';
import 'login_use_case.dart';

class SignUpPhoneUseCase extends UseCase<LoginModel, LoginParams> {
  final AuthRepository repository;

  SignUpPhoneUseCase(this.repository);

  @override
  Future<Result<LoginModel>> call({required LoginParams params}) {
    return repository.registerUser(params: params);
  }
}