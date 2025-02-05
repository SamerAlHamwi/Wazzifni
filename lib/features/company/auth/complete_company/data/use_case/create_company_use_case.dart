


import 'package:wazzifni/core/common/models/translations_model.dart';
import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../../../user/auth/login/data/repository/auth_repository.dart';
import '../model/company_model.dart';

class CreateCompanyParams extends BaseParams {

  CreateCompanyParams( {
    this.jobType,
    this.webSite,
    this.dateOfEstablishment,
    this.companyProfilePhotoId,
    this.translations,
    this.attachments,
    this.cityId,
    this.numberOfEmployees,
    this.profileImagePath,
    this.images,
  });


  final String? jobType;
  final String? webSite;
  final DateTime? dateOfEstablishment;
  final int? cityId;
  final int? numberOfEmployees;
  int? companyProfilePhotoId;
  final List<Translations>? translations;
  List<int>? attachments = [];
  final String? profileImagePath;
  final List<String>? images;


  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.putIfAbsent("jobType", () => jobType);
    queryParams.putIfAbsent("dateOfEstablishment", () => dateOfEstablishment!.toIso8601String());
    queryParams.putIfAbsent("cityId", () => cityId);
    queryParams.putIfAbsent("numberOfEmployees", () => numberOfEmployees);
    queryParams.putIfAbsent("companyProfilePhotoId", () => companyProfilePhotoId);
    queryParams.putIfAbsent("translations", () => translations!.map((e) => e.toJson()).toList());
    queryParams.putIfAbsent("attachments", () => attachments);
    queryParams.putIfAbsent("webSite", () => webSite);

    return queryParams;
  }
}

class CreateCompanyUseCase extends UseCase<CompanyModel, CreateCompanyParams> {
  final AuthRepository repository;

  CreateCompanyUseCase(this.repository);

  @override
  Future<Result<CompanyModel>> call({required CreateCompanyParams params}) {
    return repository.createCompanyAccount(params: params);
  }
}


