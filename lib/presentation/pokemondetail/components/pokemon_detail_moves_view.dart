import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/presentation/pokemondetail/bloc/pokemon_detail_bloc.dart';
import 'package:pokemon_app/presentation/pokemondetail/state/pokemon_detail_state.dart';

import '../../../domain/entity/pokemon_detail_entity.dart';
import '../event/pokemon_detail_event.dart';

class PokemonDetailMovesView extends StatelessWidget {
  final PokemonDetailEntity detail;

  const PokemonDetailMovesView({Key? key, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Text(
            '${index + 1} ${detail.moves[index]}',
            style: const TextStyle(fontSize: 14, color: Colors.black),
            textAlign: TextAlign.center,
          );
        },
        separatorBuilder: (context, index) => const Divider(
              height: 10,
            ),
        itemCount: detail.moves.length ?? 0);
  }
}
