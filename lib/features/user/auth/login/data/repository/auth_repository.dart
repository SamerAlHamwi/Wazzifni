


import 'package:wazzifni/core/boilerplate/api/http/api_urls.dart';
import 'package:wazzifni/features/user/auth/login/data/model/login_response.dart';
import '../../../../../../core/boilerplate/api/data_source/remote_data_source.dart';
import '../../../../../../core/boilerplate/api/http/http_method.dart';
import '../../../../../../core/boilerplate/repository/core_repository.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../use_case/login_use_case.dart';


class AuthRepository extends CoreRepository {


  Future<Result<LoginModel>> login({required LoginParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: true,
        url: ApiURLs.login,
        method: HttpMethod.POST,
        queryParameters: {},
        data: params.toJson(),
        converter: (json) => LoginResponse.fromJson(json), responseStr: '');
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

  // Future<Result<dynamic>> getTotalTrip({required TestParams params}) async {
  //   final result = await RemoteDataSource.modelRequest(
  //       url: EndPoints.GetAllReasonsUrl,
  //       method: HttpMethod.GET,
  //       withAuthentication: true,
  //       data: params.tojson()
  //   );
  //   return noModelCall(result: result);
  // }

  // Future<Result<List<TagItemModel>>> getAllTags({required GetAllTagsParams params}) async {
  //   final result = await RemoteDataSource.request(
  //       withAuthentication: true,
  //       url: EndPoints.GetTagsUrl,
  //       method: HttpMethod.GET,
  //       queryParameters: params.tojson(),
  //       data: {},
  //       responseStr: 'TagsResponse',
  //       converter: (json) => TagsResponse.fromJson(json));
  //   return paginatedCall(result: result);
  // }


}