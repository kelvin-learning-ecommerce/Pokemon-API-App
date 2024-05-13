// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDto _$PokemonDtoFromJson(Map<String, dynamic> json) => PokemonDto(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PokemonResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDtoToJson(PokemonDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

PokemonResult _$PokemonResultFromJson(Map<String, dynamic> json) =>
    PokemonResult(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PokemonResultToJson(PokemonResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
