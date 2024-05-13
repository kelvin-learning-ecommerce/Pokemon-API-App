import 'package:injectable/injectable.dart';
import 'package:pokemon_app/data/repository/pokemon_repository.dart';
import 'package:pokemon_app/domain/entity/pokemon_detail_entity.dart';
import 'package:pokemon_app/domain/entity/pokemon_list_entity.dart';

import 'base_usecase.dart';

@injectable
class PokemonDetailUseCase extends UseCase<PokemonDetailEntity, int> {
  PokemonDetailUseCase(this._repository);

  final PokemonRepository _repository;

  @override
  Future<PokemonDetailEntity> call(int params) async {
    var res = await _repository.fetchPokemonDetail(id: params);
    return res;
  }
}
