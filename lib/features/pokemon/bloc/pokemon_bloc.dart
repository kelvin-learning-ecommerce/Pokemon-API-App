import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_app/features/pokemon/event/pokemon_event.dart';
import 'package:pokemon_app/features/pokemon/state/pokemon_state.dart';

import '../../../core/router/navigation_config.dart';

var pokemonBloc = navigationService.navigatorKey.currentContext?.read<PokemonBloc>();

@injectable
class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  // final StorageRepository storageRepository;

  PokemonBloc() : super(PokemonStateInit()) {
    // on<SplashScreenNextPageEvent>((event, emit) async {
    //   emit(SplashScreenStateInit());
    //   emit(SplashScreenStateSuccess());
    // });
  }
}