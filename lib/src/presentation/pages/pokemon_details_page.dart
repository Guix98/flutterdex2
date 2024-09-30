import 'package:flutter/material.dart';
import 'package:flutter_dex_2/src/common/helpers/num_helpers.dart';
import 'package:flutter_dex_2/src/common/helpers/string_helpers.dart';
import 'package:flutter_dex_2/src/presentation/providers/favourite_indicator_provider.dart';
import 'package:flutter_dex_2/src/presentation/providers/pokemon_details_provider.dart';
import 'package:flutter_dex_2/src/presentation/widgets/tabs/moves/moves_tab.dart';
import 'package:flutter_dex_2/src/presentation/widgets/tabs/stats/stats_tab.dart';
import 'package:flutter_dex_2/src/presentation/widgets/tabs/tab_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PokemonDetailsPage extends ConsumerStatefulWidget {
  final String id;
  const PokemonDetailsPage({required this.id, super.key});

  @override
  PokemonDetailsPageState createState() => PokemonDetailsPageState();
}

class PokemonDetailsPageState extends ConsumerState<PokemonDetailsPage> {
  int _selectedTabIndex = 0; // Índice para las pestañas

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final id = int.parse(widget.id);
    final favouriteList = ref.watch(favouritesListProvider);
    final isFavourite = favouriteList.contains(id);
    return ref.watch(pokemonDetailProvider(id)).when(
          loading: () => Center(child: CircularProgressIndicator.adaptive()),
          error: (error, _) => Center(child: Text('Error: $error')),
          data: (pokemon) => Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => context.pop(),
              ),
              title: Text(
                pokemon.name.capitalize(),
                style: textTheme.displayMedium,
              ),
              actions: [
                IconButton(
                  iconSize: 40,
                  onPressed: () {
                    ref
                        .read(favouritesListProvider.notifier)
                        .toggle(pokemon.id);
                  },
                  icon: isFavourite
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border, color: Colors.white),
                )
              ],
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        _PokemonImageContainer(
                          url: pokemon
                              .sprites.other!.officialArtwork.frontDefault,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${pokemonHeight(pokemon.height).toString()} M",
                            style: textTheme.titleLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            'Height',
                            style: textTheme.labelSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(Icons.local_fire_department,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${pokemonWeight(pokemon.weight).toString()} KG",
                            style: textTheme.titleLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            'Weight',
                            style: textTheme.labelSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TabTitle(
                        tabIndex: 0,
                        selectedIndex: _selectedTabIndex,
                        label: 'Stats',
                        onTap: () {
                          setState(() {
                            _selectedTabIndex = 0;
                          });
                        },
                      ),
                      TabTitle(
                        tabIndex: 1,
                        selectedIndex: _selectedTabIndex,
                        label: 'Moves',
                        onTap: () {
                          setState(() {
                            _selectedTabIndex = 1;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    width: double.infinity,
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: _selectedTabIndex == 0
                          ? StatsTab(
                              stats: pokemon.stats,
                            )
                          : MovesTab(
                              moves: pokemon.moves,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}

class _PokemonImageContainer extends StatelessWidget {
  final String url;
  const _PokemonImageContainer({
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white10,
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
