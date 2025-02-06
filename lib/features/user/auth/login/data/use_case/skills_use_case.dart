


import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../complete_account/data/model/skills_model.dart';
import '../repository/auth_repository.dart';

class SkillsParams extends BaseParams {

  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.putIfAbsent("isActive", () => true);
    queryParams.putIfAbsent("MaxResultCount", () => 50);

    return queryParams;
  }
}

class GetSkillsUseCase extends UseCase<SkillsListModel, SkillsParams> {
  final AuthRepository repository;

  GetSkillsUseCase(this.repository);

  @override
  Future<Result<SkillsListModel>> call({required SkillsParams params}) {
    return repository.getAllSkills(params: params);
  }
}
