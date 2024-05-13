import 'package:injectable/injectable.dart';
import 'package:pokemon_app/data/repository/pokemon_repository.dart';
import 'package:pokemon_app/domain/entity/pokemon_list_entity.dart';

import 'base_usecase.dart';

@injectable
class PokemonListUseCase
    extends UseCase<List<PokemonListEntity>, NoParams> {
  PokemonListUseCase(this._repository);

  final PokemonRepository _repository;

  @override
  Future<List<PokemonListEntity>> call(NoParams params) async {
    var res = await _repository.fetchPokemon();
    return res;
  }
}
