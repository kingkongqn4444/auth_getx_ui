import 'dart:io';

import '../biz/biz.dart';
import 'package:dio/adapter.dart';

import '../models/models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const pageSizeResult = 20;

class AppService extends BaseService {
  AppService() {
    initAppService();
  }

  Future<BaseResponseModel> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      debugPrint('---PATH---\nGET:$path');
      debugPrint('---QUERY---\nGET:$queryParameters');
      final res = await _dio.get(path, queryParameters: queryParameters);
      debugPrint('---RESPONSE---\n$res');
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: res.data);
      } else {
        EasyLoading.dismiss();
        //Get.dialog(DialogError(messages: getMegError(res)));
      }
    } catch (e) {
      checkError(e as DioError);
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }

  Future<BaseResponseModel> post(String path, {Map<String, dynamic>? queryParameters, dynamic data}) async {
    try {
      debugPrint('---PATH---\nPOST:$path');
      debugPrint('---QUERY---\nGET:$queryParameters');
      debugPrint('---DATA---\nGET:$data');
      final res = await _dio.post(path, queryParameters: queryParameters, data: data);
      debugPrint('---RESPONSE---\n$res');
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: res.data);
      } else {
        EasyLoading.dismiss();
        //  Get.dialog(DialogError(messages: getMegError(res)));
      }
    } on Exception catch (e) {
      checkError(e as DioError);
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }

  Future<BaseResponseModel> put(String path, {Map<String, dynamic>? queryParameters, dynamic data}) async {
    try {
      debugPrint('---PATH---\nPUT:$path');
      debugPrint('---QUERY---\nGET:$queryParameters');
      debugPrint('---DATA---\nGET:$data');
      final res = await _dio.put(path, queryParameters: queryParameters, data: data);
      debugPrint('---RESPONSE---\n$res');
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: res.data);
      } else {
        EasyLoading.dismiss();
        // Get.dialog(DialogError(messages: getMegError(res)));
      }
    } catch (e) {
      checkError(e as DioError);
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }

  Future<BaseResponseModel> delete(String path, {Map<String, dynamic>? queryParameters, dynamic data}) async {
    try {
      debugPrint('---PATH---\nDELETE:$path');
      debugPrint('---QUERY---\nGET:$queryParameters');
      debugPrint('---DATA---\nGET:$data');
      final res = await _dio.delete(path, queryParameters: queryParameters, data: data);
      debugPrint('---RESPONSE---\n$res');
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: res.data);
      } else {
        EasyLoading.dismiss();
        //Get.dialog(DialogError(messages: getMegError(res)));
      }
    } catch (e) {
      checkError(e as DioError);
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }
}

abstract class BaseService {
  final String basePath = 'http://';
  late Dio _dio;
  String? _token;
  final _stg = GetStorage();

  void initAppService() {
    final headers = <String, dynamic>{
      'content-type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    _dio = Dio(
      BaseOptions(
        baseUrl: basePath,
        connectTimeout: 15000,
        receiveTimeout: 15000,
        responseType: ResponseType.json,
        headers: headers,
      ),
    );

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient dioClient) {
      dioClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
  }

  void setToken(String? token) {
    _stg.write(AppConstants.keyToken, token);
    _token = token;
    initAppService();
  }

  bool isSuccess(var response) {
    return response.statusCode == 201 || response.statusCode == 200;
  }

  String getMegError(var response) {
    return response.response['message']['error'];
  }

  dynamic responseData(var response) {
    return response.data['message'];
  }

  void checkError(DioError e) {
    EasyLoading.dismiss();
    debugPrint('---ERROR---\n${e.toString()}');
    if (e.response?.statusCode == 401) {
      Get.find<AppController>().logout();
      // Get.dialog(DialogError(messages: 'Срок действия TOKEN истек,\nпожалуйста, войдите снова!'));
    } else {
      // Get.dialog(DialogError(messages: 'oизошла ошибка!'));
    }
  }
}
