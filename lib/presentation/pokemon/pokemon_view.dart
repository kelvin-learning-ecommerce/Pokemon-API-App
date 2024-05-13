import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/presentation/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/presentation/pokemon/state/pokemon_state.dart';
import 'package:pokemon_app/presentation/pokemondetail/event/pokemon_detail_event.dart';
import 'package:pokemon_app/utils/extensions/routes_ext.dart';

import '../shared/app_bar.dart';
import 'event/pokemon_event.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({Key? key}) : super(key: key);

  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  @override
  void initState() {
    super.initState();
    pokemonBloc?.add(const LoadPokemonEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: appBar(title: 'Pokedex'),
            body: BlocBuilder<PokemonBloc, PokemonState>(
                buildWhen: (prevState, currState) =>
                currState is LoadPokemonSuccessState ||
                    currState is PokemonLoadingState,
                builder: (BuildContext context, state) {
                  if (state is LoadPokemonSuccessState) {
                    var result = state.data;

                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: GridView.builder(
                        itemBuilder: (context, int index) {
                          var item = result[index];
                          return GestureDetector(
                            onTap: () {
                              context.goToDetail(index + 1);

                              // pokemonBloc
                              //     ?.add(LoadPokemonDetailEvent(index + 1));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: getBackgroundColor("grass"),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.network(
                                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${index + 1}.png',
                                        height: 80,
                                        width: 80,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: result.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                      ),
                    );
                  }
                  return Container();
                })));
  }
}

Color getBackgroundColor(String type) {
  switch (type) {
    case 'grass':
      return Colors.teal;
    case 'bug':
      return Colors.green;
    case 'fire':
      return Colors.red;
    default:
      return Colors.blue;
  }
}

Color getTypeColor(String type) {
  switch (type) {
    case 'grass':
      return Colors.tealAccent.withOpacity(0.2);
    case 'bug':
      return Colors.lightGreen;
    case 'fire':
      return Colors.redAccent;
    default:
      return Colors.lightBlue;
  }
}
