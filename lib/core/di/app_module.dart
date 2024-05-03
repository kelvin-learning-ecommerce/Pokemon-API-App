import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../data/datasource/pokemon_list_datasource.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio get dio => buildDio();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
