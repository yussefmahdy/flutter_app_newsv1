import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Shared/Networks/local/cache_helper.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        // baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    )..interceptors.add(DioInterceptor());
  }

  static Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
    String token
  }) async
  {
    print( "Success");
    print(url);
    print(CacheHelper.getData(key: "countryCode"));
    // dio.options.headers = {
    //   "lang": CacheHelper.getData(key: "countryCode"),
    //   "Content-Type":"application/json",
    //   if(token != null)
    //   "Authorization":token,
    // };

    return await dio.get(
      "https://student.valuxapps.com/api/"+url,
      queryParameters: query,
      options: Options(headers: {
        "lang": CacheHelper.getData(key: "countryCode") ?? 'en',
        "Content-Type":"application/json",
        if(token != null)
          "Authorization":token,
      })
    );
  }

  static Future<Response> postData({
    @required String url,
    Map<String, dynamic> data,
    String token,
  }) async
  {
    dio.options.headers = {
      "lang":"en",
      "Content-Type":"application/json",
      if(token != null)
        "Authorization":token,
    };

    return await dio.post(
      url,
      data: data,
    );
  }


}

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    // ignore: avoid_print
    print('DioInterceptor.Request : ${options.method} ${options.uri} with data : ${jsonEncode(options.data)}');
    // ignore: avoid_print
    print('and headers : - ');
    for (final header in options.headers.entries) {
      // ignore: avoid_print
      print('\t\t${header.key}:${header.value}');

    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    // ignore: avoid_print
    print('DioInterceptor.Error : ${err.message}');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    // ignore: avoid_print
    print('DioInterceptor.Response : ${response.data}');
  }
}


