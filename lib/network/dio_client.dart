import 'package:applite_solutions/network/environment.dart';
import 'package:applite_solutions/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'exception_handler.dart';
import 'interceptor.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  factory DioClient() => _instance;

  DioClient._internal() {
    dio = Dio(BaseOptions(
        baseUrl: Environment.baseUrl, responseType: ResponseType.json, contentType: contentType));
    if (!kReleaseMode) {
      dio.interceptors.add(logInterceptor);
    }
  }

  Future<Response> getRequest(
      {required String endPoint,
      Options? options,
      bool requiresAuthorizationHeader = false}) async {
    try {
      final response = await dio.get(endPoint,
          options:
              options ?? Options(headers: {authorizationHeaderKey: requiresAuthorizationHeader}));
      return response;
    } on DioException catch (de) {
      throw BaseApiException.fromDioError(de);
    } on Exception catch (e) {
      throw Exception(e.toString());
    } catch (err) {
      rethrow;
    }
  }

  Future<Response> postRequest(
      {required String endPoint,
      required dynamic data,
      bool requiresAuthorizationHeader = false}) async {
    try {
      return await dio.post(endPoint,
          data: data,
          options: Options(headers: {authorizationHeaderKey: requiresAuthorizationHeader}));
    } on DioException catch (err) {
      throw BaseApiException.fromDioError(err);
    } on Exception catch (e) {
      throw Exception(e.toString());
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> patchRequest(
      {required String endPoint,
      required dynamic data,
      bool requiresAuthorizationHeader = false}) async {
    try {
      return await dio.patch(endPoint,
          data: data,
          options: Options(headers: {authorizationHeaderKey: requiresAuthorizationHeader}));
    } on DioException catch (err) {
      throw BaseApiException.fromDioError(err);
    } on Exception catch (e) {
      throw Exception(e.toString());
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> putRequest(
      {required String endPoint,
      required dynamic data,
      bool requiresAuthorizationHeader = false}) async {
    try {
      return await dio.put(endPoint,
          data: data,
          options: Options(headers: {authorizationHeaderKey: requiresAuthorizationHeader}));
    } on DioException catch (err) {
      throw BaseApiException.fromDioError(err);
    } on Exception catch (e) {
      throw Exception(e.toString());
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> deleteRequest(
      {required String endPoint,
      required dynamic data,
      bool requiresAuthorizationHeader = false}) async {
    try {
      return await dio.delete(endPoint,
          data: data,
          options: Options(headers: {authorizationHeaderKey: requiresAuthorizationHeader}));
    } on DioException catch (err) {
      throw BaseApiException.fromDioError(err);
    } on Exception catch (e) {
      throw Exception(e.toString());
    } catch (error) {
      rethrow;
    }
  }
}
