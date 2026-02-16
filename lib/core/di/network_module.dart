import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/core/network/dio_client.dart';
@module
abstract class NetworkModule {
  @lazySingleton
  DioClient get dioClient => DioClient();
  @lazySingleton
  Dio get dio => dioClient.dio;
}