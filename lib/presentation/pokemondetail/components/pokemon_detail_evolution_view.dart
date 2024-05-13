import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/pokemon_detail_entity.dart';

class PokemonDetailEvolutionView extends StatefulWidget {
  final PokemonDetailEntity detail;

  const PokemonDetailEvolutionView({Key? key, required this.detail})
      : super(key: key);

  @override
  State<PokemonDetailEvolutionView> createState() =>
      _PokemonDetailEvolutionViewState();
}

class _PokemonDetailEvolutionViewState
    extends State<PokemonDetailEvolutionView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.detail.chain?.chain?.species?.name ?? '',
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
                        widget.detail.chain?.chain?.evolvesTo?[index].species
                            ?.name ??
                            '',
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
                        widget.detail.chain?.chain?.evolvesTo?[0]
                            .evolvesTo?[index - 1].species?.name ??
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
              (widget.detail.chain?.chain?.evolvesTo?[0].evolvesTo?.length ??
                  0) +
                  1),
        )
      ],
    );
  }
}
