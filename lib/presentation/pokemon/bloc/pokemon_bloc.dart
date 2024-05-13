import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_app/domain/usecase/base_usecase.dart';
import 'package:pokemon_app/domain/usecase/pokemon_detail_usecase.dart';
import 'package:pokemon_app/domain/usecase/pokemon_list_usecase.dart';

import '../../../core/router/navigation_config.dart';
import '../event/pokemon_event.dart';
import '../state/pokemon_state.dart';

var pokemonBloc =
    navigationService.navigatorKey.currentContext?.read<PokemonBloc>();

@injectable
class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonListUseCase pokemonListUseCase;

  PokemonBloc(this.pokemonListUseCase) : super(PokemonStateInit()) {
    on<LoadPokemonEvent>((event, emit) async {
      emit(PokemonLoadingState());

      var res = await pokemonListUseCase.call(NoParams());

      emit(LoadPokemonSuccessState(res));
    });
  }
}
