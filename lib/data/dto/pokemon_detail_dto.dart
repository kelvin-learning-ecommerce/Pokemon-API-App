import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon_app/data/dto/data_mapper.dart';
import 'package:pokemon_app/domain/entity/pokemon_detail_entity.dart';

part 'pokemon_detail_dto.g.dart';

@JsonSerializable()
class PokemonDetailDto extends DataMapper<PokemonDetailEntity> {
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

  List<Abilities>? abilities;
  final int? baseExperience;

  // List<Forms>? _forms;
  // List<GameIndices>? _gameIndices;
  final int? height;
  final List<dynamic>? heldItems;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;

  List<Moves>? moves;
  final String? name;
  final int? order;
  final List<dynamic>? pastTypes;
  Species? species;

  // Sprites? _sprites;
  List<Stats>? stats;
  List<Types>? types;
  final int? weight;

  factory PokemonDetailDto.fromJson(Map<String, dynamic> json) {
    return _$PokemonDetailDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokemonDetailDtoToJson(this);

  @override
  PokemonDetailEntity mapToEntity() {
    StringBuffer ability = StringBuffer();
    abilities?.forEach((element) {
      ability.write(', ${element.ability?.name}');
    });

    var move = moves?.map((e) => e.move?.name ?? "").toList() ?? [];

    var type = types?.map((e) => e.type?.name ?? "").toList() ?? [];
    var stat = stats
            ?.map((e) =>
                StatsEntity(name: e.stat?.name ?? "", stats: e.base_stat ?? 0))
            .toList() ??
        [];

    return PokemonDetailEntity(
        id: id ?? 0 + 1,
        abilities: ability.toString(),
        height: height ?? 0,
        weight: weight ?? 0,
        moves: move,
        types: type,
        name: name ?? "",
        stats: stat);
  }
}

@JsonSerializable()
class Species {
  Species(this.name, this.url);

  @JsonKey(name: "_name")
  final String? name;
  @JsonKey(name: "_url")
  final String? url;

  factory Species.fromJson(Map<String, dynamic> json) {
    return _$SpeciesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}

@JsonSerializable()
class Abilities {
  Abilities(this.ability);

  final Ability? ability;

  factory Abilities.fromJson(Map<String, dynamic> json) {
    return _$AbilitiesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}

@JsonSerializable()
class Ability {
  Ability(this.name);

  final String? name;

  factory Ability.fromJson(Map<String, dynamic> json) {
    return _$AbilityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class Moves {
  Moves(this.move);

  final Move? move;

  factory Moves.fromJson(Map<String, dynamic> json) {
    return _$MovesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovesToJson(this);
}

@JsonSerializable()
class Move {
  Move(this.name);

  final String? name;

  factory Move.fromJson(Map<String, dynamic> json) {
    return _$MoveFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MoveToJson(this);
}

@JsonSerializable()
class Types {
  Types(this.type);

  final Type? type;

  factory Types.fromJson(Map<String, dynamic> json) {
    return _$TypesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}

@JsonSerializable()
class Type {
  Type(this.name);

  final String? name;

  factory Type.fromJson(Map<String, dynamic> json) {
    return _$TypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class Stats {
  Stats(this.stat, this.base_stat);

  final Stat? stat;
  final int? base_stat;

  factory Stats.fromJson(Map<String, dynamic> json) {
    return _$StatsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}

@JsonSerializable()
class Stat {
  Stat(this.name);

  final String? name;

  factory Stat.fromJson(Map<String, dynamic> json) {
    return _$StatFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StatToJson(this);
}
