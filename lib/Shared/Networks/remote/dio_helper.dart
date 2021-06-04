import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Shared/Networks/local/cache_helper.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
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
    dio.options.headers = {
      "lang": CacheHelper.getData(key: "countryCode"),
      "Content-Type":"application/json",
      if(token != null)
      "Authorization":token,
    };

    return await dio.get(
      "https://student.valuxapps.com/"+url,
      queryParameters: query,
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


