import 'package:pokemon_app/data/dto/poke_evolution_chain_dto.dart';

class PokemonDetailEntity {
  PokemonDetailEntity(
      {this.chain,
      required this.id,
      required this.types,
      required this.name,
      required this.url,
      required this.abilities,
      required this.height,
      required this.weight,
      required this.stats,
      required this.moves});

  final String name;
  final String url;
  final String abilities;
  final int height;
  final int weight;
  final EvolutionChainDto? chain;
  final int id;
  final List<StatsEntity> stats;
  final List<String> moves;
  final List<String> types;
}

class StatsEntity {
  String name = "";
  int stats = 0;
}
