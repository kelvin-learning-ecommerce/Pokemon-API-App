import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/features/splash/bloc/splash_screen_bloc.dart';

import '../../features/locale/bloc/locale_bloc.dart';
import '../../features/login/bloc/login_bloc.dart';
import '../../features/pokemon/bloc/pokemon_bloc.dart';
import '../../features/pokemondetail/bloc/pokemon_detail_bloc.dart';

var providerList = [
  BlocProvider<LocaleBloc>(create: (_) => LocaleBloc()),
  BlocProvider<SplashScreenBloc>(create: (_) => SplashScreenBloc()),
  BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
  BlocProvider<PokemonBloc>(create: (_) => PokemonBloc()),
  BlocProvider<PokemonDetailBloc>(create: (_) => PokemonDetailBloc()),
];
