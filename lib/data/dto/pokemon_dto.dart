import 'package:json_annotation/json_annotation.dart';

part 'pokemon_dto.g.dart';

@JsonSerializable()
class PokemonDto {
  PokemonDto(
      {this.count,
        this.next,
        this.previous,
        this.results});

  @JsonKey(name: "_count")
  final int? count;
  @JsonKey(name: "_next")
  final String? next;
  @JsonKey(name: "_previous")
  final dynamic previous;
  @JsonKey(name: "_results")
  final List<PokemonResult>? results;

  factory PokemonDto.fromJson(Map<String, dynamic> json) {
    return _$PokemonDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokemonDtoToJson(this);
}

@JsonSerializable()
class PokemonResult {
  PokemonResult(
      {this.name,
        this.url});

  @JsonKey(name: "_name")
  final String? name;
  @JsonKey(name: "_url")
  final String? url;

  factory PokemonResult.fromJson(Map<String, dynamic> json) {
    return _$PokemonResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokemonResultToJson(this);
}