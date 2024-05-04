import 'package:flutter/material.dart';
import 'package:pokemon_app/core/router/routes.dart';

extension Navigation on BuildContext {
  Future<dynamic> goToPokemon() => Navigator.pushNamed(this, pokemonRoutes);
  Future<dynamic> goToDetail(args) => Navigator.pushNamed(this, pokemonDetailRoutes, arguments: args);
  Future<dynamic> goToLogin() => Navigator.pushNamedAndRemoveUntil(this, loginRoutes, (Route<dynamic> route) => false);
}
