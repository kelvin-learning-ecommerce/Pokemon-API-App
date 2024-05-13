import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_app/domain/usecase/pokemon_detail_usecase.dart';

import '../../../core/router/navigation_config.dart';
import '../event/pokemon_detail_event.dart';
import '../state/pokemon_detail_state.dart';

var pokemonDetailBloc =
    navigationService.navigatorKey.currentContext?.read<PokemonDetailBloc>();

@injectable
class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final PokemonDetailUseCase pokemonDetailUseCase;

  PokemonDetailBloc(this.pokemonDetailUseCase)
      : super(PokemonDetailStateInit()) {
    on<PokemonDetailFetchEvent>((event, emit) async {
      emit(PokemonDetailLoadingState());

      var res = await pokemonDetailUseCase.call(event.id);

      emit(PokemonDetailStateSuccess(res));
    });
  }
}
