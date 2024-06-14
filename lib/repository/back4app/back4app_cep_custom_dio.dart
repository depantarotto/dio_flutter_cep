import 'package:dio/dio.dart';
import 'package:dio_flutter_cep/repository/back4app/back4app_cep_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Back4AppCepCustomDio {
  final _dio = Dio();

  Dio get dio => _dio;

  // ignore: non_constant_identifier_names
  Back4AppCustonDio() {
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = dotenv.get("BACK4APP_BASE_URL");
    _dio.interceptors.add(Back4AppCepInterceptor());
  }
}
