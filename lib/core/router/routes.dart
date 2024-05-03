import 'package:flutter/material.dart';
import 'package:pokemon_app/features/login/login_view.dart';
import 'package:pokemon_app/features/pokemon/pokemon_view.dart';
import 'package:pokemon_app/features/pokemondetail/pokemon_detail_view.dart';
import 'package:pokemon_app/features/splash/splash_screen.dart';

const String loginRoutes = '/LoginRoutes';
const String pokemonDetailRoutes = '/PokemonDetailRoutes';
const String pokemonRoutes = '/PokemonRoutes';
const String splashRoutes = '/SplashRoutes';

Route<dynamic> initRouter(RouteSettings settings) {
  switch (settings.name) {
    case loginRoutes:
      return MaterialPageRoute(
          builder: (context) => LoginView(),
          settings: const RouteSettings());
    case pokemonRoutes:
      return MaterialPageRoute(
          builder: (context) => PokemonView(),
          settings: const RouteSettings());
    case pokemonDetailRoutes:
      return MaterialPageRoute(
          builder: (context) => PokemonDetailView(),
          settings: const RouteSettings());
    default:
      return MaterialPageRoute(builder: (context) => const SplashScreenView(), settings: const RouteSettings());
  }
}
