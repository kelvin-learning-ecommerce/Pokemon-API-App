import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/presentation/pokemondetail/bloc/pokemon_detail_bloc.dart';
import 'package:pokemon_app/presentation/pokemondetail/state/pokemon_detail_state.dart';

import '../../../domain/entity/pokemon_detail_entity.dart';
import '../event/pokemon_detail_event.dart';

class PokemonDetailAboutView extends StatelessWidget {
  final PokemonDetailEntity detail;

  const PokemonDetailAboutView({Key? key, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        aboutDetailRow('Species', 'Seed'),
        aboutDetailRow('Height', '${detail.height}'),
        aboutDetailRow('Weight', '${detail.weight}'),
        aboutDetailRow('Abilities', abilitiesList(detail))
      ],
    );
  }
}

String abilitiesList(PokemonDetailEntity pokeDetail) {
  return pokeDetail.abilities;
}

Widget aboutDetailRow(String title, String value) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        Flexible(
          child: Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          flex: 1,
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
          flex: 2,
        )
      ],
    ),
  );
}
