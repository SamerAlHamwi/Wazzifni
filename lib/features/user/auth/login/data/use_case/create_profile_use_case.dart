


import 'package:wazzifni/features/user/auth/complete_account/data/model/award_model.dart';
import 'package:wazzifni/features/user/auth/complete_account/data/model/education_model.dart';
import 'package:wazzifni/features/user/auth/complete_account/data/model/work_experiences_model.dart';
import 'package:wazzifni/features/user/auth/login/data/model/language_model.dart';
import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../complete_account/data/model/skills_model.dart';
import '../model/user_prpfile_response.dart';
import '../repository/auth_repository.dart';

class CreateUserProfileParams extends BaseParams {

  final String about;
  final int cityId;
  final List<EducationModel> educations;
  final List<WorkExperiencesModel> workExperiences;
  final List<AwardModel> awards;
  final List<LanguageModel> spokenLanguages;
  final List<int> skillIds;
  int? profilePhotoId;
  int? cvId;
  final String? profilePhotoPath;
  final String? cvPath;

  CreateUserProfileParams(
      {required this.about,
        required this.cityId,
        required this.educations,
        required this.workExperiences,
        required this.awards,
        required this.spokenLanguages,
        required this.skillIds,
        this.profilePhotoId,
        this.cvId,
        this.profilePhotoPath,
        this.cvPath,
      });


  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.putIfAbsent('about', () => about);
    queryParams.putIfAbsent('cityId', () => cityId);
    queryParams.putIfAbsent('educations', () => educations.map((e) => e.toJson()).toList());
    queryParams.putIfAbsent('workExperiences', () => workExperiences.map((e) => e.toJson()).toList());
    queryParams.putIfAbsent('awards', () => awards.map((e) => e.toJson()).toList());
    queryParams.putIfAbsent('spokenLanguages', () => spokenLanguages.map((e) => e.toJson()).toList());
    queryParams.putIfAbsent('skillIds', () => skillIds);
    queryParams.putIfAbsent('profilePhotoId', () => profilePhotoId);
    queryParams.putIfAbsent('cvId', () => cvId);

    return queryParams;
  }
}

class CreateUserProfileUseCase extends UseCase<UserProfileModel, CreateUserProfileParams> {
  final AuthRepository repository;

  CreateUserProfileUseCase(this.repository);

  @override
  Future<Result<UserProfileModel>> call({required CreateUserProfileParams params}) {
    return repository.createUserProfileAccount(params: params);
  }
}

