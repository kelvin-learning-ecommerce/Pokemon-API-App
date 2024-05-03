import 'package:equatable/equatable.dart';

import '../../../domain/entity/pokemon_detail_entity.dart';

abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();

  @override
  List<Object?> get props => [];
}

class PokemonDetailEventFetch extends PokemonDetailEvent {
  const PokemonDetailEventFetch(this.id);

  final int id;
}
