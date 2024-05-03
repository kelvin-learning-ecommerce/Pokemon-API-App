import 'package:pokemon_app/data/repository/pokemon_repository.dart';
import 'package:pokemon_app/domain/entity/pokemon_list_entity.dart';

class PokemonListUseCase {
  PokemonListUseCase(this._repository);

  final PokemonRepository _repository;

  Future<List<PokemonListEntity>?> call({int page = 0}) async {
    final list = await _repository.fetchPokemon();

    var res = (list.results ?? []).map((e) => PokemonListEntity(e.name, e.url)).toList();

    return res;
  }
}