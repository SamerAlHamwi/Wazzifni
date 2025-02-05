


import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../model/create_account_response.dart';
import '../repository/auth_repository.dart';
import 'login_use_case.dart';

class CreateAccountUseCase extends UseCase<CreateUserModel, LoginParams> {
  final AuthRepository repository;

  CreateAccountUseCase(this.repository);

  @override
  Future<Result<CreateUserModel>> call({required LoginParams params}) {
    return repository.createUserAccount(params: params);
  }
}