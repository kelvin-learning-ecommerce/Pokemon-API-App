import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/presentation/pokemondetail/bloc/pokemon_detail_bloc.dart';
import 'package:pokemon_app/presentation/pokemondetail/state/pokemon_detail_state.dart';

import '../../../domain/entity/pokemon_detail_entity.dart';
import '../event/pokemon_detail_event.dart';

class PokemonDetailEvolutionView extends StatefulWidget {
  final PokemonDetailEntity detail;
  const PokemonDetailEvolutionView({Key? key, required this.detail}) : super(key: key);

  @override
  State<PokemonDetailEvolutionView> createState() => _PokemonDetailEvolutionViewState();
}

class _PokemonDetailEvolutionViewState extends State<PokemonDetailEvolutionView> {
  @override
  void initState() {
    super.initState();

    pokemonDetailBloc?.add(PokemonDetailEventFetch(widget.detail.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
      builder: (context, state) {
        if (state is PokemonDetailStateSuccess) {
          var result = state.data;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                result.chain?.chain?.species?.name ?? '',
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: const Icon(CupertinoIcons.arrow_down)),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              result.chain?.chain?.evolvesTo?[index].species?.name ?? '',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              result.chain?.chain?.evolvesTo?[0].evolvesTo?[index-1].species
                                  ?.name ??
                                  '',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            ),
                          ],
                        );
                      }
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: const Icon(CupertinoIcons.arrow_down));
                    },
                    itemCount:
                    (result.chain?.chain?.evolvesTo?[0].evolvesTo?.length ?? 0) + 1),
              )
            ],
          );
        }

        return Container();
      },
    );
  }
}
