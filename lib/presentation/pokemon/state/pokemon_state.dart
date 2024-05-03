import 'package:equatable/equatable.dart';
import 'package:pokemon_app/domain/entity/pokemon_list_entity.dart';

abstract class PokemonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonStateInit extends PokemonState {}

class PokemonStateLoad extends PokemonState {

  PokemonStateLoad(this.data);

  final List<PokemonListEntity> data;
}
