import 'package:pokemon_app/data/dto/poke_evolution_chain_dto.dart';

class PokemonDetailEntity{
  PokemonDetailEntity(this.name, this.url, this.chain, this.id);
  String name = "";
  String url = "";
  String abilities = "";
  int height = 0;
  int weight = 0;
  EvolutionChainDto? chain;
  int id;
  List<StatsEntity> stats = [];
  List<String> moves = [];
}

class StatsEntity{
  String name = "";
  int stats = 0;
}
