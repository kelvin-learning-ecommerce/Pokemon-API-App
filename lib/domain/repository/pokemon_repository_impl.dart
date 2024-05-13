import 'package:injectable/injectable.dart';
import 'package:pokemon_app/data/datasource/pokemon_list_datasource.dart';
import 'package:pokemon_app/data/dto/pokemon_detail_dto.dart';
import 'package:pokemon_app/data/dto/pokemon_dto.dart';
import 'package:pokemon_app/data/repository/pokemon_repository.dart';
import 'package:pokemon_app/domain/entity/pokemon_detail_entity.dart';

import '../entity/pokemon_list_entity.dart';

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({required this.baseService});

  final ApiDataSource baseService;

  @override
  Future<List<PokemonListEntity>> fetchPokemon() async {
    var res = await baseService.fetchPokemon();
    var entity = (res.results ?? []).map((e) => e.mapToEntity()).toList();
    print("repository ${entity.length}");
    return entity;
  }

  @override
  Future<PokemonDetailEntity> fetchPokemonDetail({required int id}) async {
    var res = await baseService.getPokemonDetail(id);
    return res.mapToEntity();
  }
}
