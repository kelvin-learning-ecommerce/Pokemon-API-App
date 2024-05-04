import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/presentation/pokemondetail/bloc/pokemon_detail_bloc.dart';
import 'package:pokemon_app/presentation/pokemondetail/state/pokemon_detail_state.dart';

import '../../../domain/entity/pokemon_detail_entity.dart';
import '../event/pokemon_detail_event.dart';

class PokemonDetailBaseStatsView extends StatefulWidget {
  final PokemonDetailEntity detail;

  const PokemonDetailBaseStatsView({Key? key, required this.detail}) : super(key: key);

  @override
  State<PokemonDetailBaseStatsView> createState() => _PokemonDetailBaseStatsViewState();
}

class _PokemonDetailBaseStatsViewState extends State<PokemonDetailBaseStatsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => statsItem(
      widget.detail.stats[index].name,
        widget.detail.stats[index].stats),
            // widget.detail.stats?[index].stat?.name ?? '',
            // widget.detail.stats?[index].baseStat ?? 0),
        separatorBuilder: (context, index) => const Divider(
          height: 10,
        ),
        itemCount: widget.detail.stats?.length ?? 0);
  }
}

Widget statsItem(String title, int value) {
  return Row(
    children: [
      Flexible(
        fit: FlexFit.tight,
        child: Text(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        flex: 1,
      ),
      Flexible(
        fit: FlexFit.tight,
        child: Text(
          value.toString(),
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
        flex: 1,
      ),
      Flexible(
        fit: FlexFit.tight,
        child: Stack(
          children: [
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
            FractionallySizedBox(
              widthFactor: value/100,
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            )
          ],
        ),
        flex: 2,
      )
    ],
  );
}
