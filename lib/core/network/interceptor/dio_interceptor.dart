import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_assignment/config/app_config.dart';

import '../../injection/injection.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = getIt<AppConfig>().baseUrl;
    options.connectTimeout = const Duration(seconds: 20);
    options.receiveTimeout = const Duration(seconds: 15);
    options.responseType = ResponseType.json;
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("Error[${err.error.toString()}]");
    //handler.reject(err);
    super.onError(err, handler);
  }
}
