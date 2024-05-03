import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_app/core/interceptor/app_interceptor.dart';

import '../dto/pokemon_detail_dto.dart';
import '../dto/pokemon_dto.dart';

abstract class ApiDataSource {
  Future<PokemonDto> fetchPokemon();
  Future<PokemonDetailDto> getPokemonDetail(int id) ;
}

@Injectable(as: ApiDataSource)
class ApiDataSourceImpl implements ApiDataSource {
  ApiDataSourceImpl({required this.dio});

  final Dio dio;

  Future<Response<dynamic>?> _get(String url, {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(url, queryParameters: queryParameters);
  }

  @override
  Future<PokemonDto> fetchPokemon() async {
    try {
      Response<dynamic>? response = await _get("pokemon");

      var res = response?.data;
      return PokemonDto.fromJson(res);
    } on DioException {
      throw DioException;
    }
  }

  @override
  Future<PokemonDetailDto> getPokemonDetail(int id) async {
    try {
      Response<dynamic>? response = await _get("pokemon/$id");

      var res = response?.data;
      return PokemonDetailDto.fromJson(res);
    } on DioException {
      throw DioException;
    }
  }
}

Dio buildDio() {
  var dio = Dio();

  assert(() {
    dio.interceptors.add(DioInterceptors());
    return true;
  }());

  dio.interceptors.add(NetworkInterceptors(dio));

  dio.options.baseUrl = "https://pokeapi.co/api/v2/";
  dio.options.contentType = Headers.jsonContentType;
  dio.options.connectTimeout = const Duration(minutes: 10);
  dio.options.receiveTimeout = const Duration(minutes: 10);
  dio.options.sendTimeout = const Duration(minutes: 10);

  return dio;
}
