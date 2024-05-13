import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon_app/data/dto/data_mapper.dart';
import 'package:pokemon_app/domain/entity/pokemon_list_entity.dart';

part 'pokemon_dto.g.dart';

@JsonSerializable()
class PokemonDto {
  PokemonDto({this.count, this.next, this.previous, this.results});

  final int? count;
  final String? next;
  final dynamic previous;
  final List<PokemonResult>? results;

  factory PokemonDto.fromJson(Map<String, dynamic> json) {
    return _$PokemonDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokemonDtoToJson(this);
}

@JsonSerializable()
class PokemonResult extends DataMapper<PokemonListEntity> {
  PokemonResult({this.name, this.url});

  final String? name;
  final String? url;

  factory PokemonResult.fromJson(Map<String, dynamic> json) {
    return _$PokemonResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokemonResultToJson(this);

  @override
  PokemonListEntity mapToEntity() {
    return PokemonListEntity(name, url);
  }
}
