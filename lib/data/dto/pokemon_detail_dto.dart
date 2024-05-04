import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon_app/data/dto/data_mapper.dart';
import 'package:pokemon_app/domain/entity/pokemon_detail_entity.dart';

part 'pokemon_detail_dto.g.dart';

@JsonSerializable()
class PokemonDetailDto extends DataMapper<PokemonDetailEntity>{
  PokemonDetailDto(
      this.baseExperience,
      this.height,
      this.heldItems,
      this.id,
      this.isDefault,
      this.locationAreaEncounters,
      this.name,
      this.order,
      this.pastTypes,
      this.weight,
      this.species);

  // List<Abilities>? _abilities;
  @JsonKey(name: "_baseExperience")
  final int? baseExperience;

  // List<Forms>? _forms;
  // List<GameIndices>? _gameIndices;
  @JsonKey(name: "_height")
  final int? height;
  @JsonKey(name: "_heldItems")
  final List<dynamic>? heldItems;
  @JsonKey(name: "_id")
  final int? id;
  @JsonKey(name: "_isDefault")
  final bool? isDefault;
  @JsonKey(name: "_locationAreaEncounters")
  final String? locationAreaEncounters;

  // List<Moves>? _moves;
  @JsonKey(name: "_name")
  final String? name;
  @JsonKey(name: "_order")
  final int? order;
  @JsonKey(name: "_pastTypes")
  final List<dynamic>? pastTypes;
  @JsonKey(name: "_species")
  Species? species;
  // Sprites? _sprites;
  // List<Stats>? _stats;
  // List<Types>? _types;
  @JsonKey(name: "_weight")
  final int? weight;

  factory PokemonDetailDto.fromJson(Map<String, dynamic> json) {
    return _$PokemonDetailDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokemonDetailDtoToJson(this);

  @override
  PokemonDetailEntity mapToEntity() {
    return PokemonDetailEntity(name, url, chain, id)
  }
}

@JsonSerializable()
class Species {

  Species(
      this.name,
      this.url);

  @JsonKey(name: "_name")
  final String? name;
  @JsonKey(name: "_url")
  final String? url;

  factory Species.fromJson(Map<String, dynamic> json) {
    return _$SpeciesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}

