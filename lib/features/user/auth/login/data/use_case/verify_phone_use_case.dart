


import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../model/login_response.dart';
import '../repository/auth_repository.dart';
import 'login_use_case.dart';

class VerifyPhoneUseCase extends UseCase<dynamic, LoginParams> {
  final AuthRepository repository;

  VerifyPhoneUseCase(this.repository);

  @override
  Future<Result<dynamic>> call({required LoginParams params}) {
    return repository.verifyUser(params: params);
  }
}