import 'package:pokemon_app/data/dto/poke_evolution_chain_dto.dart';

class PokemonDetailEntity{
  PokemonDetailEntity(name, url);
  String name = "";
  String url = "";
  EvolutionChainDto? chain;
}