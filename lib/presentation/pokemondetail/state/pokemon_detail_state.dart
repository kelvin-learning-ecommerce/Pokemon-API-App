import 'package:equatable/equatable.dart';

import '../../../domain/entity/pokemon_detail_entity.dart';

abstract class PokemonDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonDetailStateInit extends PokemonDetailState {}
class PokemonDetailLoadingState extends PokemonDetailState {}
class PokemonDetailStateSuccess extends PokemonDetailState {
  PokemonDetailStateSuccess(this.data);
  final PokemonDetailEntity data;

}