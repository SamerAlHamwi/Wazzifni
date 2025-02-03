


import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wazzifni/core/boilerplate/api/http/api_urls.dart';
import '../core_models/models_factory.dart';
import '../errors/bad_request_error.dart';
import '../errors/base_error.dart';
import '../errors/cancel_error.dart';
import '../errors/conflict_error.dart';
import '../errors/custom_error.dart';
import '../errors/forbidden_error.dart';
import '../errors/http_error.dart';
import '../errors/internal_server_error.dart';
import '../errors/net_error.dart';
import '../errors/not_found_error.dart';
import '../errors/socket_error.dart';
import '../errors/timeout_error.dart';
import '../errors/unauthorized_error.dart';
import '../errors/unknown_error.dart';
import 'http_method.dart';


class ApiProvider {
  static var options = BaseOptions(
    baseUrl: ApiURLs.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    validateStatus: (status) => true,
  );
  static final Dio dio = Dio(options);
  static Future<Either<BaseError, T>> uploadFile<T>({
    required String url,
    required String fileKey,
    required File file,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    required String strString,
  }) async {
    final Map<String, dynamic> dataMap = {};
    if (data != null) {
      dataMap.addAll(data);
    }
    final Map<String, dynamic> queryMap = {};
    if (queryParameters != null) {
      queryMap.addAll(queryParameters);
    }
    List<MultipartFile> multipartFiles = [];
    String fileName = file.path.split("/").last;
    multipartFiles.add(await MultipartFile.fromFile(file.path, filename: fileName));

    dataMap.addAll({fileKey: multipartFiles, 'MnD': 'MnD'});

    try {
      final response = await dio.post(
        url,
        data: FormData.fromMap(dataMap),
        options: Options(headers: headers),
        queryParameters: queryMap,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );

      // Get the decoded json
      var decodedJson;
      if (response.data is String) {
        decodedJson = json.decode(response.data);
      } else {
        decodedJson = response.data;
      }
      if (decodedJson['result'] == null) decodedJson['result'] = {'id': 0, 'file': ''};

      return Right(ModelsFactory.getInstance()!.createModel<T>(decodedJson, strString));
    }

    // Handling errors
    on DioException catch (e) {
      return Left(handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      return Left(SocketError());
    }
  }

  static Future<Either<BaseError, T>> sendObjectRequest<T>({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    required String strString,
  }) async {
    try {

      dio.options.headers = headers;

      Response response;


      switch (method) {
        case HttpMethod.GET:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
          );
          break;
        case HttpMethod.POST:
          response = await dio.post(
            url,
            data: data,
            queryParameters: queryParameters ?? {},
          );

          break;
        case HttpMethod.PUT:
          response = await dio.put(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        case HttpMethod.DELETE:
          response = await dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
      }
      dio.interceptors.add(PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));

      // Get the decoded json
      var decodedJson;

      if (response.data is String) {
        decodedJson = json.decode(response.data);
      } else {
        decodedJson = response.data;
      }

      if (decodedJson['result'] == false || decodedJson['result'] == true) decodedJson['result'] = {'': ''};
      if ((response.statusCode)! > 199 && (response.statusCode)! < 300) {
        if (decodedJson['success'] == true) {
          if (decodedJson['result'] != null) {
            return Right(ModelsFactory.getInstance()!.createModel<T>(decodedJson, strString));
          } else {
            return Left(CustomError(
              message: 'Data Not Found',
            ));
          }
        } else {
          return Left(CustomError(
            message: decodedJson['error']['message'],
          ));
        }
        // Return the http response with actual data
      } else {
        // Utils.showToast(decodedJson['error']['message'] ?? '');
        return Left(CustomError(
          message: decodedJson['error']['message'],
        ));
      }
    }

    // Handling errors
    on DioException catch (e) {
      return Left(handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      return Left(SocketError());
    }
  }

  static Future<Either<BaseError, bool>> sendObjectWithOutResponseRequest<T>({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {

      dio.options.headers = headers;

      // Get the response from the server
      Response response;
      switch (method) {
        case HttpMethod.GET:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
          );
          break;
        case HttpMethod.POST:
          response = await dio.post(
            url,
            data: data,
            queryParameters: queryParameters ,
          );
          break;
        case HttpMethod.PUT:
          response = await dio.put(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        case HttpMethod.DELETE:
          response = await dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
      }

      // Get the decoded json
      var decodedJson;

      if (response.data is String) {
        decodedJson = json.decode(response.data);
      } else {
        decodedJson = response.data;
      }

      if (decodedJson['result'] == false || decodedJson['result'] == true) decodedJson['result'] = {'': ''};

      if ((response.statusCode)! > 199 && (response.statusCode)! < 300) {
        if (decodedJson['success'] == true) {
          return const Right(true);
        } else {
          return Left(CustomError(
            message: decodedJson['errors'],
          ));
        }
      }
      // Return the http response with actual data
      else {
        return Left(CustomError(
          message: decodedJson['errors'],
        ));
      }
    }

    // Handling errors
    on DioException catch (e) {
      return Left(handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      return Left(SocketError());
    }
  }

  static Future<Either<BaseError, T>> sendObjectWithResponseRequest<T>({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      dio.options.headers = headers;

      Response response;
      switch (method) {
        case HttpMethod.GET:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
          );
          break;
        case HttpMethod.POST:
          response = await dio.post(
            url,
            data: data,
            queryParameters: queryParameters ?? {},
          );
          break;
        case HttpMethod.PUT:
          response = await dio.put(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        case HttpMethod.DELETE:
          response = await dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
      }

      // Get the decoded json
      var decodedJson;

      if (response.data is String) {
        decodedJson = json.decode(response.data);
      } else {
        decodedJson = response.data;
      }

      if (decodedJson['result'] == false || decodedJson['result'] == true) decodedJson['result'] = {'': ''};
      if ((response.statusCode)! > 199 && (response.statusCode)! < 300) {
        if (decodedJson['success'] == true) {
          return Right(decodedJson['data']);
        } else {
          return Left(CustomError(
            message: decodedJson['errors'],
          ));
        }
      }
      // Return the http response with actual data
      else {
        return Left(CustomError(
          message: decodedJson['errors'],
        ));
      }
    }

    // Handling errors
    on DioError catch (e) {
      return Left(handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      return Left(SocketError());
    }
  }

  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static BaseError handleDioError(DioError error) {
    if (error.type != DioExceptionType.unknown) {
      if (error is SocketException) return SocketError();
      switch (error.response!.statusCode) {
        case 400:
          String errors = '';
          if (error.response!.data['error']['message'] is String) {
            errors = error.response?.data['error']['message'];
          } else {
            errors = error.response!.data['error']['message'];
          }
          return BadRequestError(); //message: error.response!.data['error']['message']
        case 401:
          return UnauthorizedError();
        case 403:
          return ForbiddenError();
        case 404:
          return NotFoundError(); //message: error.message!
        case 409:
          return ConflictError(); //message: error.response!.data['error']['message'], code: error.response!.data['code']
        case 500:
          return InternalServerError();
        default:
          return HttpError(); //message: error.response!.data['error']['message']
      }
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return TimeoutError(); //message: S.of(Keys.navigatorKey.currentContext!).please_check_your_connection
    } else if (error.type == DioExceptionType.cancel) {
      return CancelError();
    } else {
      return UnknownError(); //errorMessage: S.of(Keys.navigatorKey.currentContext!).please_check_your_connection
    }
  }
}
