


import 'package:wazzifni/core/boilerplate/api/http/api_urls.dart';
import 'package:wazzifni/features/user/auth/login/data/model/login_response.dart';
import '../../../../../../core/boilerplate/api/data_source/remote_data_source.dart';
import '../../../../../../core/boilerplate/api/http/http_method.dart';
import '../../../../../../core/boilerplate/repository/core_repository.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/common/models/attachment_model.dart';
import '../../../../../../core/common/models/enums.dart';
import '../../../../../company/auth/complete_company/data/model/company_model.dart';
import '../../../../../company/auth/complete_company/data/use_case/create_company_use_case.dart';
import '../../../complete_account/data/model/skills_model.dart';
import '../model/cities_response.dart';
import '../model/create_account_response.dart';
import '../model/language_model.dart';
import '../model/user_prpfile_response.dart';
import '../use_case/cities_use_case.dart';
import '../use_case/create_profile_use_case.dart';
import '../use_case/languages_use_case.dart';
import '../use_case/login_use_case.dart';
import '../use_case/skills_use_case.dart';


class AuthRepository extends CoreRepository {

  ///Login
  Future<Result<LoginModel>> login({required LoginParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: false,
        url: ApiURLs.login,
        method: HttpMethod.POST,
        queryParameters: {},
        data: params.toJson(),
        converter: (json) => LoginResponse.fromJson(json),
        responseStr: 'login'
    );
    return call(result: result);
  }

  ///Register
  Future<Result<LoginModel>> registerUser({required LoginParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: false,
        url: ApiURLs.register,
        method: HttpMethod.POST,
        queryParameters: {},
        data: params.toJson(),
        converter: (json) => LoginResponse.fromJson(json),
        responseStr: 'register',
    );
    return call(result: result);
  }

  Future<Result<CreateUserModel>> createUserAccount({required LoginParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: false,
        url: ApiURLs.createUserAccount,
        method: HttpMethod.POST,
        queryParameters: {},
        data: params.toJson(),
        converter: (json) => CreateUserResponse.fromJson(json),
        responseStr: 'CreateUserResponse',
    );
    return call(result: result);
  }

  Future<Result<dynamic>> verifyUser({required LoginParams params}) async {
    final result = await RemoteDataSource.modelRequest(
        url: ApiURLs.verifyRegister,
        method: HttpMethod.POST,
        withAuthentication: false,
        data: params.toJson(),
    );
    return noModelCall(result: result);
  }

  ///Cities
  Future<Result<CityListModel>> getCities({required CitiesParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: false,
      url: ApiURLs.allCities,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => CityListResponse.fromJson(json),
      responseStr: 'CreateUserResponse',
    );
    return call(result: result);
  }

  ///Languages
  Future<Result<LanguageListModel>> getLanguages({required LanguagesParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: false,
      url: ApiURLs.allLanguages,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => LanguageListResponse.fromJson(json),
      responseStr: 'LanguageListResponse',
    );
    return call(result: result);
  }

  Future<Result<CompanyModel>> createCompanyAccount({required CreateCompanyParams params}) async {

    List<int> ids = [];
    if(params.profileImagePath != null){
      Result<Attachments> result = await uploadImage(image: params.profileImagePath!,type: AttachmentRefType.companyLogo.index);
      params.companyProfilePhotoId = result.data!.id;
    }

    if(params.images != null){
      for(int i = 0; i < params.images!.length; i++){
        Result<Attachments> result = await uploadImage(image: params.images![i],type: AttachmentRefType.companyImage.index);
        ids.add(result.data!.id!);
      }
    }
    params.attachments = [];
    params.attachments!.addAll(ids);

    final result = await RemoteDataSource.request(
      withAuthentication: false,
      url: ApiURLs.createCompanyAccount,
      method: HttpMethod.POST,
      data: params.toJson(),
      converter: (json) => CreateCompanyResponse.fromJson(json),
      responseStr: 'CreateCompanyResponse',
    );
    return call(result: result);
  }


  Future<Result<Attachments>> uploadImage({
    required String image,
    required int type,
    bool isImageType = true,
  }) async {
    final result = await RemoteDataSource.request(
      withAuthentication: false,
      url: ApiURLs.uploadAttachment,
      data: {'RefType': type},
      method: HttpMethod.POST,
      converter: (json) => AttachmentsResponse.fromJson(json),
      responseStr: 'AttachmentsResponse',
      files: {'File': image},
      isImageType: isImageType,
    );
    return call(result: result);
  }


  ///Skills
  Future<Result<SkillsListModel>> getAllSkills({required SkillsParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: false,
      url: ApiURLs.allSkills,
      method: HttpMethod.GET,
      queryParameters: {'IsActive': true, 'MaxResultCount': 50},
      converter: (json) => SkillsListResponse.fromJson(json),
      responseStr: 'SkillsListResponse',
    );
    return call(result: result);
  }


  Future<Result<UserProfileModel>> createUserProfileAccount({required CreateUserProfileParams params}) async {

    if(params.cvPath != null){
      Result<Attachments> result = await uploadImage(image: params.cvPath!,type: AttachmentRefType.cv.index,isImageType: false);
      params.cvId = result.data!.id;
    }

    if(params.profilePhotoPath != null){
      Result<Attachments> result = await uploadImage(image: params.profilePhotoPath!,type: AttachmentRefType.profile.index);
      params.profilePhotoId = result.data!.id;
    }

    final result = await RemoteDataSource.request(
      withAuthentication: false,
      url: ApiURLs.createUserProfile,
      method: HttpMethod.PUT,
      data: params.toJson(),
      converter: (json) => UserProfileResponse.fromJson(json),
      responseStr: 'UserProfileResponse',
    );
    return call(result: result);
  }



  // Future<Result<List<ResonsItemModel>>> getAllReasons({required GetAllReasonsParams params}) async {
  //   final result = await RemoteDataSource.request(
  //       withAuthentication: true,
  //       url: EndPoints.GetAllReasonsUrl,
  //       method: HttpMethod.GET,
  //       queryParameters: params.tojson(),
  //       data: {},
  //       responseStr: 'ReasonsReportResponse',
  //       converter: (json) => ReasonsReportResponse.fromJson(json));
  //   return paginatedCall(result: result);
  // }



}