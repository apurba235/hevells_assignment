import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:havells_assignments/presentation/widgets/snackbar.dart';

enum _RestApiMethod { get, put, post, patch, delete }


class RestApi {
  RestApi._();

  static final instance = RestApi._();

  static String _baseUrl = '';
  static bool _showApiLog = false;

  Future<void> initialize(
      {required String baseUrl, required bool showApiLog, required String apiVersion}) async {
    RestApi._baseUrl = baseUrl;
    RestApi._showApiLog = showApiLog;
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  Future<Map<String, dynamic>> getHeader() async {
    final Map<String, dynamic> headers = {
      'Authorization': "Basic TmRBTW5BazdpZ3hxOEkxZHZXeTVQc3hjSmsyWUFpV0c6VkhsdUxKSWM2S2RiRUxxMA==",
      'Access-Control-Allow-Headers': true,
      'Content-Type': 'application/json',
    };
    return headers;
  }


  Dio dio = Dio(BaseOptions(baseUrl: _baseUrl));


  Future<Map<String, dynamic>?> _restApi(
      String path, {
        required _RestApiMethod apiMethod,
        dynamic body = const <Map<String, String>>{},
        Map<String, dynamic>? header,
        Map<String, dynamic>? queryParameters,
        ResponseType? responseType,
        bool attachToken = true,
        bool showError = true,
      }) async {
    try {

      Response? response;

      final options = header != null
          ? Options(headers: header, responseType: responseType)
          : (attachToken ? Options(headers: await getHeader(), responseType: responseType) : null);

      switch (apiMethod) {
        case _RestApiMethod.get:
          response = await dio.get(path, queryParameters: queryParameters, options: options);
          break;
        case _RestApiMethod.put:
          response = await dio.put(path, data: body, options: options);
          break;
        case _RestApiMethod.post:
          response = await dio.post(path, data: body, options: options);
          break;
        case _RestApiMethod.patch:
          response = await dio.patch(path, data: body, options: options);
          break;
        case _RestApiMethod.delete:
          response = await dio.delete(path, data: body, options: options);
          break;
      }

      if (response.data is Map?) {
        Map<String, dynamic>? x = response.data as Map<String, dynamic>?;
        if (x != null && (x['status'] != false)) {
          return x;
        } else {
          if (showError) {
            String errorMessage = '${x?['message'].toString()}';
            if (!errorMessage.contains('SocketException') && !errorMessage.contains('HttpException')) {
              showSnackBar(errorMessage, isError: true);
            } else {
              showSnackBar('Something went wrong!', isError: true);
            }
          }
        }
      }
    } on DioException catch (e) {
      ///if exception show the error
      Response<dynamic> response;
      if (e.response is Response<Map<String, dynamic>?>) {
        response = e.response as Response<Map<String, dynamic>?>;
      } else {
        final data = e.response?.data;
        response = Response<dynamic>(
          requestOptions: RequestOptions(path: path),
          statusCode: e.response?.statusCode ?? -101,
          statusMessage: (data is Map) ? data['message'].toString() : (e.message ?? 'Something went wrong..'),
        );
      }
      log('${e.error}', name: 'DIO EXCEPTION ERROR');
      log('${e.response?.data}', name: 'DIO EXCEPTION DATA');
      log('${e.stackTrace}', name: 'DIO EXCEPTION STACK');
      log('${e.response?.statusCode}', name: 'DIO EXCEPTION STATUS CODE');
      log('${e.response?.statusMessage}', name: 'DIO EXCEPTION message');
      // _apiLog(
      //   path,
      //   apiVersion: apiVersion,
      //   apiMethod: apiMethod,
      //   body: body,
      //   header: e.response?.requestOptions.headers,
      //   queryParameters: queryParameters,
      //   response: e.response,
      // );
      return null;
    }
  }

  Future<Map<String, dynamic>?> get(
      String path, {
        String apiVersion = '',
        String? baseUrl,
        bool attachToken = true,
        Map<String, dynamic>? queryParameters,
      }) {
    return _restApi(
      path,
      queryParameters: queryParameters,
      apiMethod: _RestApiMethod.get,
    );
  }


}