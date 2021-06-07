import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loono/core/app_config.dart';
import 'package:loono/core/http/logger_interceptor.dart';
import 'package:loono/loono.dart';
import 'package:loono/services/firebase_service.dart';
import 'package:provider/provider.dart';

Future<Widget> buildApp({required AppConfig config}) async {
  await FirebaseService.create(config);

  // TODO(any): pass this instance of Dio to the services
  final _dio = Dio(config.dioBaseOptions);

  _dio.interceptors.add(LoggerInterceptor());

  return MultiProvider(
    providers: [
      Provider<AppConfig>.value(value: config),
    ],
    child: Loono(config: config),
  );
}
