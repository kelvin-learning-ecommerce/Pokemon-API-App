import 'package:pokemon_app/data/dto/poke_evolution_chain_dto.dart';

class PokemonDetailEntity{
  PokemonDetailEntity(this.name, this.url, this.chain, this.id);
  String name = "";
  String url = "";
  EvolutionChainDto? chain;
  int id;
}