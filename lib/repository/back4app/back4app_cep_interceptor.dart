import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Back4AppCepInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["X-Parse-Application-Id"] =
        dotenv.get("BACK4APP_APPLICATION_ID");
    options.headers["X-Parse-REST-API-Key"] =
        dotenv.get("BACK4APP_REST_API_KEY");

    return super.onRequest(options, handler);
  }
}
