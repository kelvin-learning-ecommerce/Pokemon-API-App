import 'package:equatable/equatable.dart';

import '../../../domain/entity/pokemon_detail_entity.dart';

abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();

  @override
  List<Object?> get props => [];
}

class PokemonDetailFetchEvent extends PokemonDetailEvent {
  const PokemonDetailFetchEvent(this.id);

  final int id;
}

class PokemonDetailSuccessEvent extends PokemonDetailEvent {
  const PokemonDetailSuccessEvent(this.data);

  final PokemonDetailEntity data;
}
