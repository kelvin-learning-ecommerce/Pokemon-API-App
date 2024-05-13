import 'package:pokemon_app/data/dto/poke_evolution_chain_dto.dart';

class PokemonDetailEntity {
  PokemonDetailEntity(
      {this.chain,
      required this.id,
      required this.types,
      required this.name,
      required this.abilities,
      required this.height,
      required this.weight,
      required this.stats,
      required this.moves});

  final String name;
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
  StatsEntity({required this.name, required this.stats});

  final String name;

  final int stats;
}
