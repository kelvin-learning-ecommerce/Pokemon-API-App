import 'package:pokemon_app/data/repository/pokemon_repository.dart';
import 'package:pokemon_app/domain/entity/pokemon_list_entity.dart';

import 'base_usecase.dart';

class PokemonListUseCase
    extends UseCase<List<PokemonListEntity>, NoParams> {
  PokemonListUseCase(this._repository);

  final PokemonRepository _repository;

  @override
  Future<List<PokemonListEntity>> call(NoParams params) async {
    return await _repository.fetchPokemon();
  }
}
