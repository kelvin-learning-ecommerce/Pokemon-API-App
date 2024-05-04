import 'package:pokemon_app/data/dto/pokemon_dto.dart';
import 'package:pokemon_app/domain/entity/pokemon_detail_entity.dart';

import '../../domain/entity/pokemon_list_entity.dart';
import '../dto/pokemon_detail_dto.dart';

abstract class PokemonRepository {
  Future<List<PokemonListEntity>> fetchPokemon();
  Future<PokemonDetailEntity> fetchPokemonDetail({required int id});
}