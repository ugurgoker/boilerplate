import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../../core/constant/app_config.dart';
import '../../core/services/service_api.dart';
import '../../core/services/service_route.gr.dart';
import '../../core/models/model_login.dart';
import '../../core/settings/controller_language.dart';
import '../../core/settings/controller_theme.dart';
import '../../core/utils/general_data.dart';
import '../../ui/base/base_view_model.dart';
import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class ViewModelSplash extends ViewModelBase {
  // final Duration _splashDuration = const Duration(seconds: 2);

  ViewModelSplash(BuildContext context) {
    this.context = context;
    if (!kIsWeb) {
      ThemeController.getTheme();
      LanguageController.setLanguage(context: context, language: GeneralData.getLanguage());
    }
    init();
  }

  Future<void> init() async {
    final apiClient = ServiceApi(Dio());

    ModelLogin model = ModelLogin(userName: '', password: '');

    await apiClient.login(model).then((response) {
      log(response.message);
      AppConfig.rootRouter.replace(ViewLoginRoute(id: response.result!.id!));
    }).onError((error, stackTrace) {
      log('error');
    });
  }
}
