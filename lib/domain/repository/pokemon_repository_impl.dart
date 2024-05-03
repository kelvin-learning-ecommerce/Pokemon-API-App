import 'package:injectable/injectable.dart';
import 'package:pokemon_app/data/datasource/pokemon_list_datasource.dart';
import 'package:pokemon_app/data/dto/pokemon_detail_dto.dart';
import 'package:pokemon_app/data/dto/pokemon_dto.dart';
import 'package:pokemon_app/data/repository/pokemon_repository.dart';

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({required this.baseService});

  final ApiDataSource baseService;

  @override
  Future<PokemonDto> fetchPokemon() async {
    var res = await baseService.fetchPokemon();
    return res;
  }

  @override
  Future<PokemonDetailDto> fetchPokemonDetail({required int id}) async {
    var res = await baseService.getPokemonDetail(id);
    return res;
  }
}