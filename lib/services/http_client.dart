import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'generic_http_response.dart';

enum HttpRequestType {
  get,
  post,
  put,
  patch,
  delete,
}

class HttpClientWrapper {
  static final Dio dio = Dio();

  static String baseURL = 'https://logikeep.trashit.com.ng/api';

  static String apiUrl(String path, Map<String, dynamic>? queryParams) {
    String uriString = '$baseURL/$path';
    return Uri.parse(uriString)
        .replace(queryParameters: queryParams)
        .toString();
  }

  static Future<Dio> _dio() async {
    final GetStorage box = GetStorage();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };

    if (box.hasData('token')) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer ${box.read('token')}';
    }
    dio.options.headers = headers;
    dio.options.connectTimeout = 60000;
    dio.options.receiveTimeout = 60000;

    return dio;
  }

  Future<GenericHttpResponse> _executeHttpRequest(
      HttpRequestType httpRequestType,
      String path,
      Map<String, dynamic>? queryParams,
      {dynamic body}) async {
    Response dioResponse;
    GenericHttpResponse response = GenericHttpResponse();
    final dio = await _dio();

    try {
      debugPrint('Url: ${apiUrl(path, queryParams)}');
      if (body != null) debugPrint('Body: $body');
      body = jsonEncode(body);
      switch (httpRequestType) {
        case HttpRequestType.get:
          dioResponse = await dio.get(
            apiUrl(path, queryParams),
          );
          break;
        case HttpRequestType.post:
          dioResponse = await dio.post(
            apiUrl(path, queryParams),
            data: body,
          );
          break;
        case HttpRequestType.put:
          dioResponse = await dio.put(
            apiUrl(path, queryParams),
            data: body,
          );
          break;
        case HttpRequestType.patch:
          dioResponse = await dio.patch(
            apiUrl(path, queryParams),
            data: body,
          );
          break;
        case HttpRequestType.delete:
          dioResponse = await dio.delete(apiUrl(path, queryParams));
          break;
        default:
          dioResponse = await dio.get(
            apiUrl(path, queryParams),
          );
          break;
      }
      //If request was successful
      response.success = true;
      response.body = dioResponse.data;
      response.status = dioResponse.statusCode!;
      response.message = dioResponse.statusMessage!;
      debugPrint('STATUS CODE: ${dioResponse.statusCode!}');
      debugPrint('SUCCESS: True');
      debugPrint('MESSAGE: ${dioResponse.statusMessage!}');
      debugPrint('RESPONSE BODY: ${dioResponse.data}');

      return response;
    } catch (e) {
      final dioError = e as DioError;
      if (dioError.response?.data is Map) {
        var responseMap = dioError.response?.data as Map;
        if (responseMap.containsKey('msg')) {
          response.message = dioError.response?.data['msg'];
        } else if (responseMap.containsKey('message')) {
          response.message = dioError.response?.data['message'];
        } else {
          response.body = dioError.response?.data;
        }
      } else if (dioError.response?.data is String) {
        response.message = dioError.response?.data;
      } else {
        response.message = dioError.message;
      }

      response.status = dioError.response?.statusCode ?? 400;
      response.error = dioError.error;
      response.success = false;
      debugPrint('STATUS CODE: ${response.status}');
      debugPrint('SUCCESS: False');
      debugPrint('ERROR: ${response.error}');
      debugPrint('MESSAGE: ${response.message}');
      debugPrint('RESPONSE BODY: ${response.body}');
      return response;
    }
  }

  Future<GenericHttpResponse> get(String path,
      {Map<String, dynamic>? queryParams}) async {
    return await _executeHttpRequest(HttpRequestType.get, path, queryParams);
  }

  Future<GenericHttpResponse> post(String path,
      {Map<String, dynamic>? queryParams, dynamic body}) async {
    return await _executeHttpRequest(HttpRequestType.post, path, queryParams,
        body: body);
  }

  Future<GenericHttpResponse> put(String path,
      {Map<String, dynamic>? queryParams, dynamic body}) async {
    return await _executeHttpRequest(HttpRequestType.put, path, queryParams,
        body: body);
  }

  Future<GenericHttpResponse> patch(String path,
      {Map<String, dynamic>? queryParams, dynamic body}) async {
    return await _executeHttpRequest(HttpRequestType.patch, path, queryParams,
        body: body);
  }

  Future<GenericHttpResponse> deleteRequest(String path,
      {Map<String, dynamic>? queryParams}) async {
    return await _executeHttpRequest(HttpRequestType.delete, path, queryParams);
  }

  Future<GenericHttpResponse> uploadImage(String path, File image) async {
    String fileName = image.path.split('/').last;
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(image.path, filename: fileName),
    });
    Response response = await dio.post(path, data: formData);
    return GenericHttpResponse(
      success: true,
      body: response.data,
      status: response.statusCode!,
      message: response.statusMessage!,
    );
  }
}
