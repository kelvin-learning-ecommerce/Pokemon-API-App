import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/router/navigation_config.dart';
import '../event/pokemon_detail_event.dart';
import '../state/pokemon_detail_state.dart';

var pokemonDetailBloc = navigationService.navigatorKey.currentContext?.read<PokemonDetailBloc>();

@injectable
class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  // final StorageRepository storageRepository;

  PokemonDetailBloc() : super(PokemonDetailStateInit()) {
    // on<SplashScreenNextPageEvent>((event, emit) async {
    //   emit(SplashScreenStateInit());
    //   emit(SplashScreenStateSuccess());
    // });
  }
}