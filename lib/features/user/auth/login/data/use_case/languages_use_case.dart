




import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../model/language_model.dart';
import '../repository/auth_repository.dart';

class LanguagesParams extends BaseParams {

  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.putIfAbsent("isActive", () => true);
    queryParams.putIfAbsent("MaxResultCount", () => 50);

    return queryParams;
  }
}

class GetLanguagesUseCase extends UseCase<LanguageListModel, LanguagesParams> {
  final AuthRepository repository;

  GetLanguagesUseCase(this.repository);

  @override
  Future<Result<LanguageListModel>> call({required LanguagesParams params}) {
    return repository.getLanguages(params: params);
  }
}
