import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon_app/data/dto/pokemon_detail_dto.dart';

part 'poke_evolution_chain_dto.g.dart';

@JsonSerializable()
class EvolutionChainDto {
  EvolutionChainDto(this.chain, this.id);

  final Chain? chain;
  final int? id;

  factory EvolutionChainDto.fromJson(Map<String, dynamic> json) {
    return _$EvolutionChainDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EvolutionChainDtoToJson(this);
}

@JsonSerializable()
class Chain {
  Chain(this.evolvesTo, this.species);

  @JsonKey(name: "_evolvesTo")
  final List<EvolvesTo>? evolvesTo;
  @JsonKey(name: "_species")
  final Species? species;

  factory Chain.fromJson(Map<String, dynamic> json) {
    return _$ChainFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChainToJson(this);
}

@JsonSerializable()
class EvolvesTo {
  EvolvesTo(this.evolvesTo, this.species);

  @JsonKey(name: "_evolvesTo")
  final List<dynamic>? evolvesTo;
  @JsonKey(name: "_species")
  final Species? species;

  factory EvolvesTo.fromJson(Map<String, dynamic> json) {
    return _$EvolvesToFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EvolvesToToJson(this);
}
