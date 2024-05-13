// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailDto _$PokemonDetailDtoFromJson(Map<String, dynamic> json) =>
    PokemonDetailDto(
      json['baseExperience'] as int?,
      json['height'] as int?,
      json['heldItems'] as List<dynamic>?,
      json['id'] as int?,
      json['isDefault'] as bool?,
      json['locationAreaEncounters'] as String?,
      json['name'] as String?,
      json['order'] as int?,
      json['pastTypes'] as List<dynamic>?,
      json['weight'] as int?,
      json['species'] == null
          ? null
          : Species.fromJson(json['species'] as Map<String, dynamic>),
    )
      ..abilities = (json['abilities'] as List<dynamic>?)
          ?.map((e) => Abilities.fromJson(e as Map<String, dynamic>))
          .toList()
      ..moves = (json['moves'] as List<dynamic>?)
          ?.map((e) => Moves.fromJson(e as Map<String, dynamic>))
          .toList()
      ..stats = (json['stats'] as List<dynamic>?)
          ?.map((e) => Stats.fromJson(e as Map<String, dynamic>))
          .toList()
      ..types = (json['types'] as List<dynamic>?)
          ?.map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PokemonDetailDtoToJson(PokemonDetailDto instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'baseExperience': instance.baseExperience,
      'height': instance.height,
      'heldItems': instance.heldItems,
      'id': instance.id,
      'isDefault': instance.isDefault,
      'locationAreaEncounters': instance.locationAreaEncounters,
      'moves': instance.moves,
      'name': instance.name,
      'order': instance.order,
      'pastTypes': instance.pastTypes,
      'species': instance.species,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
    };

Species _$SpeciesFromJson(Map<String, dynamic> json) => Species(
      json['_name'] as String?,
      json['_url'] as String?,
    );

Map<String, dynamic> _$SpeciesToJson(Species instance) => <String, dynamic>{
      '_name': instance.name,
      '_url': instance.url,
    };

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) => Abilities(
      json['ability'] == null
          ? null
          : Ability.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilitiesToJson(Abilities instance) => <String, dynamic>{
      'ability': instance.ability,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      json['name'] as String?,
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'name': instance.name,
    };

Moves _$MovesFromJson(Map<String, dynamic> json) => Moves(
      json['move'] == null
          ? null
          : Move.fromJson(json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovesToJson(Moves instance) => <String, dynamic>{
      'move': instance.move,
    };

Move _$MoveFromJson(Map<String, dynamic> json) => Move(
      json['name'] as String?,
    );

Map<String, dynamic> _$MoveToJson(Move instance) => <String, dynamic>{
      'name': instance.name,
    };

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'type': instance.type,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      json['name'] as String?,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      json['stat'] == null
          ? null
          : Stat.fromJson(json['stat'] as Map<String, dynamic>),
      json['base_stat'] as int?,
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'stat': instance.stat,
      'base_stat': instance.base_stat,
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      json['name'] as String?,
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'name': instance.name,
    };
