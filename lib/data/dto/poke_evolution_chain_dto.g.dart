// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_evolution_chain_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionChainDto _$EvolutionChainDtoFromJson(Map<String, dynamic> json) =>
    EvolutionChainDto(
      json['chain'] == null
          ? null
          : Chain.fromJson(json['chain'] as Map<String, dynamic>),
      json['id'] as int?,
    );

Map<String, dynamic> _$EvolutionChainDtoToJson(EvolutionChainDto instance) =>
    <String, dynamic>{
      'chain': instance.chain,
      'id': instance.id,
    };

Chain _$ChainFromJson(Map<String, dynamic> json) => Chain(
      (json['_evolvesTo'] as List<dynamic>?)
          ?.map((e) => EvolvesTo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['_species'] == null
          ? null
          : Species.fromJson(json['_species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChainToJson(Chain instance) => <String, dynamic>{
      '_evolvesTo': instance.evolvesTo,
      '_species': instance.species,
    };

EvolvesTo _$EvolvesToFromJson(Map<String, dynamic> json) => EvolvesTo(
      json['_evolvesTo'] as List<dynamic>?,
      json['_species'] == null
          ? null
          : Species.fromJson(json['_species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EvolvesToToJson(EvolvesTo instance) => <String, dynamic>{
      '_evolvesTo': instance.evolvesTo,
      '_species': instance.species,
    };
