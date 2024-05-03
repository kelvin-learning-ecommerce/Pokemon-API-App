// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailDto _$PokemonDetailDtoFromJson(Map<String, dynamic> json) =>
    PokemonDetailDto(
      json['_baseExperience'] as int?,
      json['_height'] as int?,
      json['_heldItems'] as List<dynamic>?,
      json['_id'] as int?,
      json['_isDefault'] as bool?,
      json['_locationAreaEncounters'] as String?,
      json['_name'] as String?,
      json['_order'] as int?,
      json['_pastTypes'] as List<dynamic>?,
      json['_weight'] as int?,
    );

Map<String, dynamic> _$PokemonDetailDtoToJson(PokemonDetailDto instance) =>
    <String, dynamic>{
      '_baseExperience': instance.baseExperience,
      '_height': instance.height,
      '_heldItems': instance.heldItems,
      '_id': instance.id,
      '_isDefault': instance.isDefault,
      '_locationAreaEncounters': instance.locationAreaEncounters,
      '_name': instance.name,
      '_order': instance.order,
      '_pastTypes': instance.pastTypes,
      '_weight': instance.weight,
    };
