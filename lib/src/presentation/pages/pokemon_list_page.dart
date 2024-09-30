import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dex_2/src/presentation/providers/pokemon_collection_provider.dart';
import 'package:flutter_dex_2/src/presentation/widgets/appbar/fade_out_app_bar.dart';
import 'package:flutter_dex_2/src/presentation/widgets/pokemon_grid/pokemon_grid.dart';
import 'package:flutter_dex_2/src/presentation/widgets/sliver_search_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonListPage extends ConsumerStatefulWidget {
  const PokemonListPage({super.key});

  @override
  PokemonListPageState createState() => PokemonListPageState();
}

class PokemonListPageState extends ConsumerState<PokemonListPage> {
  late ScrollController _scrollController;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          FocusScope.of(context).unfocus();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoadingMore =
        ref.watch(pokemonCollectionProvider.notifier).isLoadingMore;
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          FadeOutAppBar(),
          SliverSearchBar(),
          ref.watch(pokemonCollectionProvider).when(
                data: (data) {
                  return PokemonGrid(
                    pokemonInfo: data,
                  );
                },
                error: (o, s) => SliverToBoxAdapter(child: SizedBox.shrink()),
                loading: () => PokemonGridSkeleton(),
              ),
          if (isLoadingMore) ...[PokemonGridSkeleton()],
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
              child: ElevatedButton(
                onPressed: () {
                  ref.read(pokemonCollectionProvider.notifier).addMorePokemon();
                },
                child: Text('Ver mas Pokémon'),
              ),
            ),
          )
        ],
      ),
      drawer: const Drawer(
        child: Text('Drawer'),
      ),
    );
  }
}
