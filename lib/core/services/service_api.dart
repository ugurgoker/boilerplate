import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '/core/enums/enum_app.dart';
import '/core/models/response_data.dart';
import '/core/resources/_r.dart';
import '/core/services/service_endpoint.dart';
import '/core/utils/general_data.dart';
import '/core/utils/utilities.dart';
import 'package:http/io_client.dart';

class ServiceApi {
  static ServiceApi? _instance;
  static ServiceApi getInstance() => _instance ??= ServiceApi();

  final HttpClient _httpClient = HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
  late IOClient _client;

  ServiceApi() {
    _client = IOClient(_httpClient);
  }

  Future<ResponseData<T>> apiRequest<T>(BuildContext context, {required ApiRequestModel apiRequest}) async {
    bool isTimeOut = false;
    Duration timeoutDuration = const Duration(minutes: 1);
    FutureOr<Response> Function()? timeoutFunction;
    timeoutFunction = () { isTimeOut = true; return Response('', 600);};
    Uri url = Uri.parse(GeneralData.getInstance().baseUrl + apiRequest.endpoint);
    Map<String, String> apiHeader = { 
      'Content-Type': 'application/json',
    };
    // if(GeneralData.getInstance().getAuthToken() != '') {
    //   apiHeader.addAll({
    //     'Authorization': 'Bearer ${GeneralData.getInstance().getAuthToken()}',
    //     'Accept-Language': LanguageController.currentLocale.toLanguageTag(),
    //   });
    // }
    if(apiRequest.header != null) {
      apiHeader.addAll(apiRequest.header!);
    }
    log(DateTime.now().toIso8601String(), name: 'API LOADING - ${apiRequest.id.toString()}');
    log(apiRequest.endpoint, name: 'API URL - ${apiRequest.id.toString()}');
    log(apiRequest.apiMethod.toString(), name: 'API METHOD - ${apiRequest.id.toString()}');
    log(JsonMapper.serialize(apiRequest.body), name: 'REQUEST BODY - ${apiRequest.id.toString()}');
    try {
      if(await Utilities.isOnline()) {
        switch (apiRequest.apiMethod) {
          case ApiMethod.get:
            return _responseConverter<T>(context, await _client.get(url, headers: apiHeader).timeout(timeoutDuration, onTimeout: timeoutFunction), isTimeOut, apiRequest);
          case ApiMethod.post:
            return _responseConverter<T>(context, await _client.post(url, headers: apiHeader, body: JsonMapper.serialize(apiRequest.body)).timeout(timeoutDuration, onTimeout: timeoutFunction), isTimeOut, apiRequest);
          case ApiMethod.put:
            return _responseConverter<T>(context, await _client.put(url, headers: apiHeader, body: JsonMapper.serialize(apiRequest.body)).timeout(timeoutDuration, onTimeout: timeoutFunction), isTimeOut, apiRequest);
          case ApiMethod.delete:
            return _responseConverter<T>(context, await _client.delete(url, headers: apiHeader).timeout(timeoutDuration, onTimeout: timeoutFunction), isTimeOut, apiRequest);
          case ApiMethod.multipart:
            return _multipartRequest<T>(context, apiRequest: apiRequest);
          default:
            return ResponseData(isSuccess: false, message: R.string.genericError, response: null);
        }
      }
      else {
        return ResponseData(isSuccess: false, message: R.string.networkError, response: null);
      }
    } on ClientException catch(e) {
      return ResponseData(isSuccess: false, message: '${R.string.genericError} ${e.toString()}');
    }
    catch (e) {
      return ResponseData(isSuccess: false, message: e.toString());
    }
      
  }

  Future<ResponseData<T>> _multipartRequest<T>(BuildContext context, {required ApiRequestModel apiRequest}) async {
    bool isTimeOut = false;
    Duration timeoutDuration = const Duration(seconds: 20);
    FutureOr<Response> Function() timeoutFunction;
    timeoutFunction = () { isTimeOut = true; return Response('', 600);};
    Uri url = Uri.parse(GeneralData.getInstance().baseUrl + apiRequest.endpoint);
    Map<String, String> apiHeader = { 
      'Content-Type': 'multipart/form-data',
    };
    // if(GeneralData.getInstance().getAuthToken() != '') {
    //   apiHeader.addAll({
    //     'Authorization': 'Bearer ${GeneralData.getInstance().getAuthToken()}',
    //     'Accept-Language': LanguageController.currentLocale.toLanguageTag(),
    //   });
    // }
    if(apiRequest.header != null) {
      apiHeader.addAll(apiRequest.header!);
    }

    MultipartRequest request = http.MultipartRequest('POST', url);
    if (apiRequest.multipartFiles != null) {
      request.files.addAll(apiRequest.multipartFiles!);
    }
    request.headers.addAll(apiHeader);

    return _responseConverter<T>(context, await http.Response.fromStream(await _client.send(request)).timeout(timeoutDuration, onTimeout: timeoutFunction), isTimeOut, apiRequest);
  }
  

  ResponseData<T> _responseConverter<T>(BuildContext context, Response response, bool isTimeOut, ApiRequestModel apiRequest) {
    log(DateTime.now().toIso8601String(), name: 'API LOADED - ${apiRequest.id.toString()}');
    ResponseData<T> o = ResponseData<T>(isSuccess: false, message: '', response: response);
    o.statusCode = response.statusCode;
    var logName = 'API ${o.isSuccess ? 'Success' : 'Error'}  - ${apiRequest.id.toString()}';
    log('------------------- $logName -----------------------------------------------------------------------------------------------', name: logName);
    log('Response body: ${response.body}', name: logName);
    log('Status code: ${response.statusCode}', name: logName);
    if (isTimeOut) {
      o.message = R.string.connectionTimeOut;
    } else {
      if (o.statusCode == 401) {
        // Utilities.startNewView(context, route: const ViewLoginRoute());
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        o = ResponseData<T>.fromJson(jsonDecode(response.body), response);
      } else {
        o.message = '${R.string.genericError} ${response.statusCode}';
      }
    }
    log('Response Message: ${o.message}', name: logName);
    log('------------------------------------------------------------------------------------------------------------------------------', name: logName);
    return o;
  }
}