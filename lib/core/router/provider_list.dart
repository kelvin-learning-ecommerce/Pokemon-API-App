import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/locale/bloc/locale_bloc.dart';
import '../../presentation/login/bloc/login_bloc.dart';
import '../../presentation/pokemon/bloc/pokemon_bloc.dart';
import '../../presentation/pokemondetail/bloc/pokemon_detail_bloc.dart';
import '../../presentation/splash/bloc/splash_screen_bloc.dart';

var providerList = [
  BlocProvider<LocaleBloc>(create: (_) => LocaleBloc()),
  BlocProvider<SplashScreenBloc>(create: (_) => SplashScreenBloc()),
  BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
  BlocProvider<PokemonBloc>(create: (_) => PokemonBloc()),
  BlocProvider<PokemonDetailBloc>(create: (_) => PokemonDetailBloc()),
];
