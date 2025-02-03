import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../responses/ApiResponse.dart';
import '../core_models/models_factory.dart';
import '../errors/base_error.dart';
import '../http/api_provider.dart';
import '../http/http_method.dart';
import 'model.dart';

abstract class RemoteDataSource {
  static Future<Either<BaseError, Data>>
  request<Data extends BaseModel, Response extends ApiResponse<Data>>({
    required String responseStr,
    required Response Function(Map<String, dynamic>) converter,
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? language,
    bool withAuthentication = false,
  }) async {
    ModelsFactory.getInstance()!.registerModel(responseStr, converter);
    final Map<String, String> headers = {};
    // late UserController userController = Provider.of<UserController>(
    //     Keys.navigatorKey.currentContext!,
    //     listen: false);
    // if (withAuthentication) {
    //   headers.putIfAbsent("Authorization",
    //           () => 'Bearer ${userController.currentUser.userToken}');
    // }
    //
    // headers.putIfAbsent("Accept-Language",
    //         () => language ?? AppSharedPreferences.appLanguageCode!);
    headers.putIfAbsent("accept", () => "text/plain");

    final response = await ApiProvider.sendObjectRequest<Response>(
      method: method,
      url: url,
      headers: headers,
      queryParameters: queryParameters,
      data: data,
      strString: responseStr,
    );

    if (response.isLeft()) {
      return Left((response as Left<BaseError, Response>).value);
    } else {
      debugPrint(
          'response right ${(response as Right<BaseError, Response>).value}');
      final resValue = response.value;
      return Right(resValue.data);
    }
  }

  static Future<Either<BaseError, bool>> noModelRequest({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    bool withAuthentication = false,
  }) async {
    final Map<String, String> headers = {};
    // late UserController userController = Provider.of<UserController>(
    //     Keys.navigatorKey.currentContext!,
    //     listen: false);
    // if (withAuthentication) {
    //   // await checkTokenValidation();
    //   // final String token = CashHelper.getData(key: kACCESSTOKEN);
    //   headers.putIfAbsent("Authorization",
    //           () => 'Bearer ${userController.currentUser.userToken}');
    // }
    // headers.putIfAbsent(
    //     "Accept-Language", () => AppSharedPreferences.appLanguageCode!);
    headers.putIfAbsent("Content-Type", () => "application/json");

    final response = await ApiProvider.sendObjectWithOutResponseRequest(
      method: method,
      url: url,
      headers: headers,
      queryParameters: queryParameters,
      data: data,
    );

    if (kDebugMode) {
      //  print('is right : ${response.isRight()}');
    }
    //debugPrint('is right : ${response.isRight()}');
    if (response.isLeft()) {
      //  debugPrint('is left');
      return Left((response as Left<BaseError, bool>).value);
    } else {
      //  debugPrint('response right ${(response as Right<BaseError, bool>).value}');
      final resValue = response;
      return resValue;
    }
  }

  static Future<Either<BaseError, T>> modelRequest<T>({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    bool withAuthentication = false,
  }) async {
    final Map<String, String> headers = {};
    // late UserController userController = Provider.of<UserController>(
    //     Keys.navigatorKey.currentContext!,
    //     listen: false);
    // if (withAuthentication) {
    //   // await checkTokenValidation();
    //   //  final String token = CashHelper.getData(key: kACCESSTOKEN);
    //   headers.putIfAbsent("Authorization",
    //           () => 'Bearer ${userController.currentUser.userToken}');
    // }
    // headers.putIfAbsent(
    //     "Accept-Language", () => AppSharedPreferences.appLanguageCode!);
    headers.putIfAbsent("Content-Type", () => "'application/json");

    final response = await ApiProvider.sendObjectWithResponseRequest(
      method: method,
      url: url,
      headers: headers,
      queryParameters: queryParameters,
      data: data,
    );

    if (kDebugMode) {
      //debugPrint('is right : ${response.isRight()}');
    }
    if (kDebugMode) {
      //debugPrint('is right : ${response.isRight()}');
    }
    if (response.isLeft()) {
      // debugPrint('is left');
      return Left((response as Left<BaseError, int>).value);
    } else {
      debugPrint('response right ${(response as Right<BaseError, T>).value}');
      final resValue = Right(response).value;
      return resValue;
    }
  }

  static Future<Either<BaseError, Data>> upload<Data>({
    required String responseStr,
    required Data Function(Map<String, dynamic>) converter,
    required String url,
    required String fileKey,
    required File files,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool withAuthentication = false,
    CancelToken? cancelToken,
  }) async {
    // ModelsFactory.getInstance()!.registerModel(responseStr, converter);
    final Map<String, String> headers = {};
    // late UserController userController =
    // Provider.of<UserController>(Keys.navigatorKey.currentContext!);
    // if (withAuthentication) {
    //   headers.putIfAbsent("Authorization",
    //           () => 'Bearer ${userController.currentUser.userToken}');
    // }

    final response = await ApiProvider.uploadFile<Data>(
        fileKey: fileKey,
        file: files,
        url: url,
        headers: headers,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        strString: responseStr);

    //print('is right : ${response.isRight()}');
    if (response.isLeft()) {
      //  print('is left');
      return Left((response as Left<BaseError, Data>).value);
    } else {
      // print('response right ${(response as Right<BaseError, Data>).value}');
      final resValue = (response as Right<BaseError, Data>).value;

      return Right(resValue);
    }
  }
}
