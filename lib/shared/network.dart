import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:weather_app/shared/network_exception.dart';
import 'package:weather_app/shared/response_server.dart';

class Network {
  late Dio _dio;

  Network(Dio dio) {
    _dio = dio;
    _dio.interceptors.add(HttpFormatter());
  }

  Future<dynamic> request(String method, String path,
      {required String contentType,
      Map<String, dynamic>? queryParams,
      dynamic content}) async {
    late Response responseJson;

    var _data = (content is FormData) ? content : json.encode(content);

    // Map<String, dynamic> headers = {
    // };

    // if (method == 'POST' || method == 'PUT') {
    //   headers['Content-Type'] = contentType;
    //   headers['Accept'] = contentType;
    // }

    // _dio.options.headers = headers;
    _dio.options.contentType = contentType;
    _dio.options.connectTimeout = 8000;
    _dio.options.receiveTimeout = 8000;

    try {
      if (method == 'POST') {
        responseJson =
            await _dio.post(path, data: _data, queryParameters: queryParams);
      } else if (method == 'PUT') {
        responseJson =
            await _dio.put(path, data: _data, queryParameters: queryParams);
      } else if (method == 'DELETE') {
        responseJson = await _dio.delete(path, queryParameters: queryParams);
      } else if (method == 'PATCH') {
        responseJson =
            await _dio.patch(path, queryParameters: queryParams, data: _data);
      } else {
        responseJson = await _dio.get(path, queryParameters: queryParams);
      }

      if (responseJson.statusCode! >= 200 && responseJson.statusCode! <= 300) {
        return ResponseServer(
            data: responseJson.data,
            header: responseJson.headers,
            statusCode: responseJson.statusCode);
      }
    } on DioError catch (e) {
      _returnResponseError(e);
    }
  }

  dynamic _returnResponseError(DioError e) {
    String messageDefault =
        'Koneksi Terputus.\nSilahkan coba beberapa saat lagi';

    switch (e.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw NetworkException(
            httpStatus: e.response?.statusCode,
            responseCode: e.response?.headers.value('responseCode'),
            responseMessage: e.response?.statusMessage ?? messageDefault);
      case DioErrorType.response:
        if (e.response?.statusCode == 404) {
          String? _message = '';
          if (e.response?.statusMessage == null) {
            _message = 'Not Found';
          } else {
            _message = e.response?.statusMessage;
          }
          throw NetworkException(
              httpStatus: e.response?.statusCode,
              responseCode: e.response?.headers.value('responseCode'),
              responseMessage: '404 - $_message');
        }
        if (e.response?.statusCode == 502) {
          throw NetworkException(
              httpStatus: e.response?.statusCode,
              responseCode: e.response?.headers.value('responseCode'),
              responseMessage: 'FORBIDDEN ACCESS');
        }
        if (e.response?.statusCode == 500) {
          throw NetworkException(
              httpStatus: e.response?.statusCode,
              responseCode: e.response?.headers.value('responseCode'),
              responseMessage:
                  e.response?.statusMessage ?? 'Internal Server Error');
        }
        if (e.response?.statusCode == 401) {
          throw NetworkException(
              httpStatus: e.response?.statusCode,
              responseCode: e.response?.headers.value('responseCode'),
              responseMessage: e.response?.statusMessage ?? 'Session Expired');
        }
        if (e.response?.data is Map<String, dynamic>) {
          throw NetworkException(
              httpStatus: e.response?.statusCode,
              responseCode: e.response?.headers.value('responseCode'),
              responseMessage: e.response?.headers.value('responseMessage') ??
                  (e.response?.data["message"] ?? ''));
        }
        throw NetworkException(
            httpStatus: e.response?.statusCode,
            responseCode: e.response?.headers.value('responseCode'),
            responseMessage: e.response?.headers.value('responseMessage') ??
                (e.response?.data ?? ''));
      case DioErrorType.cancel:
        throw 'Cancel';
      case DioErrorType.other:
        if (e.message.contains('SocketException')) {
          throw NetworkException(responseMessage: 'checkIntenrnetException');
        }
        throw 'Maaf, sedang mengalami gangguan ' +
            e.response!.statusCode.toString();
    }
  }
}
