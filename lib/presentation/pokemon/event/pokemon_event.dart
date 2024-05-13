import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object?> get props => [];
}

class LoadPokemonEvent extends PokemonEvent {
  const LoadPokemonEvent();
}

class LoadPokemonDetailEvent extends PokemonEvent {
  const LoadPokemonDetailEvent(this.id);
  final int id;
}
