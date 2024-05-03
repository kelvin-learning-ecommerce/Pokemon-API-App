import 'package:equatable/equatable.dart';

abstract class PokemonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonStateInit extends PokemonState {}