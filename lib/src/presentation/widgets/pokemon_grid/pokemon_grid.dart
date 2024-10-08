import 'package:flutter/material.dart';
import 'package:flutter_dex_2/src/common/helpers/string_helpers.dart';
import 'package:flutter_dex_2/src/presentation/providers/favourite_indicator_provider.dart';
import 'package:flutter_dex_2/src/services/pokemon_info_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

part '_skeleton.dart';

class PokemonGrid extends ConsumerStatefulWidget {
  final List<PokemonInfo> pokemonInfo;
  const PokemonGrid({
    super.key,
    required this.pokemonInfo,
  });

  @override
  PokemonGridState createState() => PokemonGridState();
}

class PokemonGridState extends ConsumerState<PokemonGrid> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final favouriteList = ref.watch(favouritesListProvider);

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final pokemon = widget.pokemonInfo[index];
          final isFavourite = favouriteList.contains(pokemon.id);

          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  context.push('/details/${pokemon.id}');
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: pokemon.backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black54,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          pokemon.imageUrl,
                          height: MediaQuery.of(context).size.height * 0.15,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              Text(
                                pokemon.name.capitalize(),
                                style: textTheme.titleMedium,
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      ref
                          .read(favouritesListProvider.notifier)
                          .toggle(pokemon.id);
                    },
                    icon: isFavourite
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border,
                            color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
        childCount: widget.pokemonInfo.length,
      ),
    );
  }
}
