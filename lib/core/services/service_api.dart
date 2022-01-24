import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import '../../core/enums/enum_app.dart';
import '../../core/utils/utilities.dart';
import '../../core/utils/general_data.dart';
import '../../core/models/response_data.dart';
import '../../core/services/service_endpoint.dart';

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
    // if(GeneralData.getInstance().getAuthToken() != null) {
    //   apiHeader.addAll({'Authorization': GeneralData.getInstance().getAuthToken()!});
    // }
    if(apiRequest.header != null) {
      apiHeader.addAll(apiRequest.header!);
    }

    try {
      if(await Utilities.isOnline()) {
        switch (apiRequest.apiMethod) {
          case ApiMethod.get:
            return _responseConverter<T>(context, await _client.get(url, headers: apiHeader).timeout(timeoutDuration, onTimeout: timeoutFunction), isTimeOut);
          case ApiMethod.post:
            return _responseConverter<T>(context, await _client.post(url, headers: apiHeader, body: JsonMapper.serialize(apiRequest.body)).timeout(timeoutDuration, onTimeout: timeoutFunction), isTimeOut);
          case ApiMethod.put:
            return _responseConverter<T>(context, await _client.put(url, headers: apiHeader, body: JsonMapper.serialize(apiRequest.body)).timeout(timeoutDuration, onTimeout: timeoutFunction), isTimeOut);
          case ApiMethod.delete:
            return _responseConverter<T>(context, await _client.delete(url, headers: apiHeader).timeout(timeoutDuration, onTimeout: timeoutFunction), isTimeOut);
          case ApiMethod.multipart:
            return _multipartRequest<T>(context, apiRequest: apiRequest);
          default:
            return ResponseData(isSuccess: false, message: 'R.string.genericError');
        }
      }
      else {
        return ResponseData(isSuccess: false, message: 'R.string.networkError');
      }
    } on ClientException catch(e) {
      return ResponseData(isSuccess: false, message: e.toString());
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
    Uri url = Uri.parse(GeneralData.getInstance().fileUrl + apiRequest.endpoint);
    Map<String, String> apiHeader = { 
      'Content-Type': 'multipart/form-data',
    };
    // if(GeneralData.getInstance().getAuthToken() != null) {
    //   apiHeader.addAll({'Authorization': GeneralData.getInstance().getAuthToken()!});
    // }
    if(apiRequest.header != null) {
      apiHeader.addAll(apiRequest.header!);
    }

    MultipartRequest request = http.MultipartRequest('POST', url);
    request.files.addAll(apiRequest.multipartFiles!);
    request.headers.addAll(apiHeader);

    return _responseConverter<T>(context, await http.Response.fromStream(await request.send()).timeout(timeoutDuration, onTimeout: timeoutFunction), isTimeOut);
  }
  

  ResponseData<T> _responseConverter<T>(BuildContext context, Response response, bool isTimeOut) {
    ResponseData<T> o = ResponseData<T>(isSuccess: false);
    o.statusCode = response.statusCode;
    if (isTimeOut) {
      o.message = 'R.string.connectionTimeOut';
    } else {
      o = ResponseData<T>.fromJson(jsonDecode(response.body));
      GeneralData.getInstance().serverTime = o.serverTime!;
    }
    if (!o.isSuccess) {
      log('------------------- Api Error! -----------------------------------------------------------------------------------------------');
      log('Error code: ' + response.statusCode.toString());
      log('Response type: ' + response.request!.method);
      log('Response Message: ' + o.message!);
      log('Response url: ' + response.request!.url.path);
      log('Response body: ' + response.body);
      log('------------------------------------------------------------------------------------------------------------------------------');
    }
    return o;
  }
}