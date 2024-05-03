import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/presentation/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/presentation/pokemon/state/pokemon_state.dart';
import 'package:pokemon_app/utils/extensions/routes_ext.dart';

class PokemonView extends StatelessWidget {
  const PokemonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Pokedex'),
            ),
            body: BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonStateLoad) {
                  var result = state.data;

                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                      itemBuilder: (context, int index) {
                        var item = result[index];
                        return GestureDetector(
                          onTap: () {
                            context.goToDetail(index+1);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: getBackgroundColor("grass"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    // Expanded(
                                    //   child: Container(
                                    //     decoration: const BoxDecoration(
                                    //         borderRadius: BorderRadius.all(
                                    //             Radius.circular(10))),
                                    //     child: ListView.builder(
                                    //       itemBuilder: (context, index) {
                                    //         var typeItem =
                                    //         item.pokeDetail.types?[index];
                                    //
                                    //         return Container(
                                    //           padding:
                                    //           const EdgeInsets.symmetric(
                                    //               horizontal: 10,
                                    //               vertical: 5),
                                    //           decoration: BoxDecoration(
                                    //               color: getTypeColor(item
                                    //                   .pokeDetail
                                    //                   .types?[0]
                                    //                   .type
                                    //                   ?.name ??
                                    //                   ''),
                                    //               borderRadius:
                                    //               BorderRadius.circular(
                                    //                   20)),
                                    //           margin: const EdgeInsets.only(
                                    //               bottom: 5),
                                    //           child: Text(
                                    //             typeItem?.type?.name ?? '',
                                    //             textAlign: TextAlign.center,
                                    //             style: const TextStyle(
                                    //                 color: Colors.white,
                                    //                 fontWeight:
                                    //                 FontWeight.w500),
                                    //           ),
                                    //         );
                                    //       },
                                    //       itemCount:
                                    //       item.pokeDetail.types?.length ??
                                    //           0,
                                    //       shrinkWrap: true,
                                    //       physics:
                                    //       const NeverScrollableScrollPhysics(),
                                    //     ),
                                    //   ),
                                    // ),
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
              },
            )));

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
