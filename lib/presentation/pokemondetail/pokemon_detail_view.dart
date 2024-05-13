import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/domain/entity/pokemon_detail_entity.dart';
import 'package:pokemon_app/presentation/pokemondetail/bloc/pokemon_detail_bloc.dart';
import 'package:pokemon_app/presentation/pokemondetail/components/pokemon_detail_about_view.dart';
import 'package:pokemon_app/presentation/pokemondetail/components/pokemon_detail_base_stats_view.dart';
import 'package:pokemon_app/presentation/pokemondetail/components/pokemon_detail_evolution_view.dart';
import 'package:pokemon_app/presentation/pokemondetail/components/pokemon_detail_moves_view.dart';
import 'package:pokemon_app/presentation/pokemondetail/state/pokemon_detail_state.dart';

import '../pokemon/pokemon_view.dart';
import 'event/pokemon_detail_event.dart';

class PokemonDetailView extends StatefulWidget {
  final int id;

  const PokemonDetailView({Key? key, required this.id}) : super(key: key);

  @override
  State<PokemonDetailView> createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView>
    with TickerProviderStateMixin {
  late TabController tabController;

  List<Widget> pagesList = [];

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
    pokemonDetailBloc?.add(PokemonDetailFetchEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
      builder: (context, state) {
        if (state is PokemonDetailStateSuccess) {
          var result = state.data;

          pagesList = [
            PokemonDetailAboutView(
              detail: result,
            ),
            PokemonDetailBaseStatsView(
              detail: result,
            ),
            PokemonDetailEvolutionView(
              detail: result,
            ),
            PokemonDetailMovesView(
              detail: result,
            )
          ];


          return SafeArea(
              child: Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  color: getBackgroundColor("grass"),
                  // widget.detail.chain.types?[0].type?.name ?? ''),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                result.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 35,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    var typeItem = result.types[index];

                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: getTypeColor(typeItem),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      margin: const EdgeInsets.only(
                                          bottom: 5, right: 5),
                                      child: Text(
                                        typeItem,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    );
                                  },
                                  itemCount: result.types.length ?? 0,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                ),
                              )
                            ],
                          ),
                          Text(
                            '#00${result.id}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.network(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${result.id}.png',
                        height: 150,
                        width: 150,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        fit: StackFit.passthrough,
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.2),
                                    width: 2.0),
                              ),
                            ),
                          ),
                          TabBar(
                            labelStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                            controller: tabController,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            indicatorColor: Colors.blueGrey,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            onTap: (index) {
                              setState(() {
                                tabController.index = index;
                              });
                            },
                            tabs: const [
                              Tab(
                                text: 'About',
                              ),
                              Tab(
                                text: 'Base Stats',
                              ),
                              Tab(
                                text: 'Evolution',
                              ),
                              Tab(
                                text: 'Moves',
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 400,
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          child: TabBarView(
                            physics: const BouncingScrollPhysics(),
                            dragStartBehavior: DragStartBehavior.down,
                            controller: tabController,
                            children: pagesList,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
        }

        return Container();
      },
    );
  }
}
