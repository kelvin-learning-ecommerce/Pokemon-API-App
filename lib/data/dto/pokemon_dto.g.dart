// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDto _$PokemonDtoFromJson(Map<String, dynamic> json) => PokemonDto(
      count: json['_count'] as int?,
      next: json['_next'] as String?,
      previous: json['_previous'],
      results: (json['_results'] as List<dynamic>?)
          ?.map((e) => PokemonResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDtoToJson(PokemonDto instance) =>
    <String, dynamic>{
      '_count': instance.count,
      '_next': instance.next,
      '_previous': instance.previous,
      '_results': instance.results,
    };

PokemonResult _$PokemonResultFromJson(Map<String, dynamic> json) =>
    PokemonResult(
      name: json['_name'] as String?,
      url: json['_url'] as String?,
    );

Map<String, dynamic> _$PokemonResultToJson(PokemonResult instance) =>
    <String, dynamic>{
      '_name': instance.name,
      '_url': instance.url,
    };
