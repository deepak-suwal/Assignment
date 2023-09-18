import 'package:flutter_assignment/core/network/dio_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @singleton
  DioClient get dioClient => DioClient();
}
