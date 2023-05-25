import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import '../../core/services/service_firebase.dart';

import '../resources/_r.dart';
import '../settings/controller_language.dart';
import 'api_client.dart';

class ServiceApi extends ChangeNotifier {
  late Dio dio;

  late ApiClient _client;

  final ServiceFirebase _firebaseService;

  ApiClient get client => _client;

  final String tagAuthorization = 'Authorization';
  String? accessToken;

  ServiceApi(this.accessToken, this._firebaseService) {
    createDio();
  }

  void createDio() {
    dio = Dio(BaseOptions(headers: accessToken == null ? {} : {tagAuthorization: 'Bearer $accessToken'}, connectTimeout: const Duration(seconds: 120)));

    dio.httpClientAdapter = IOHttpClientAdapter()
      ..onHttpClientCreate = (_) => HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: onRequest, onResponse: onResponse, onError: onError));
    dio.options.headers.addEntries([
      const MapEntry('Content-Type', 'application/json'),
      MapEntry('Accept-Language', LanguageController.currentLocale.languageCode),
      MapEntry('XApiKey', FlavorConfig.instance.variables['api-key'])
    ]);
    _client = ApiClient(dio, baseUrl: FlavorConfig.instance.variables['baseUrl']);
  }

  void setAuthToken(String? accessToken) {
    this.accessToken = accessToken;
    if (accessToken != null) {
      if (dio.options.headers[tagAuthorization] != null) {
        dio.options.headers[tagAuthorization] = 'Bearer $accessToken';
      } else {
        dio.options.headers.addEntries([MapEntry(tagAuthorization, 'Bearer $accessToken')]);
      }
    } else {
      dio.options.headers[tagAuthorization] = null;
    }
  }

  Future<void> onError(DioError e, ErrorInterceptorHandler handler) async {
    e = e.copyWith(message: R.string.genericError);
    return handler.next(e);
  }

  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    _firebaseService.logEvent(options.uri.toString(), {'data': options.data.toString()});
    return handler.next(options);
  }

  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    var isSuccess = (response.data?['success']) ?? false;
    if (isSuccess) {
      return handler.next(response);
    } else {
      DioError e = DioError(requestOptions: RequestOptions(path: ''));
      String? errorMessage = (response.data?['error']);
      e = e.copyWith(message: errorMessage ?? R.string.genericError);
      return handler.reject(e);
    }
  }
}
