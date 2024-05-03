import 'package:pokemon_app/data/dto/pokemon_dto.dart';

import '../dto/pokemon_detail_dto.dart';

abstract class PokemonRepository {
  Future<PokemonDto> fetchPokemon();
  Future<PokemonDetailDto> fetchPokemonDetail({required int id});
}