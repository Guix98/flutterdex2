import 'package:flutter/material.dart';
import 'package:flutter_dex_2/src/presentation/providers/pokemon_details_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SliverSearchBar extends ConsumerStatefulWidget {
  const SliverSearchBar({super.key});

  @override
  SliverSearchBarState createState() => SliverSearchBarState();
}

class SliverSearchBarState extends ConsumerState<SliverSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(24),
            ),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onSubmitted: (value) => _searchPokemon(),
              decoration: const InputDecoration(
                hintText: 'Buscar',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _searchPokemon() async {
    final pokemonName = _controller.text.toLowerCase();
    if (pokemonName.isEmpty) return;

    try {
      final details =
          await ref.read(pokemonDetailsSearchProvider(pokemonName).future);
      print('details: $details');

      if (mounted) {
        context.push('/details/${details.id}');
      }
    } catch (e) {
      _focusNode.unfocus();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No existe el Pokémon: $pokemonName'),
          ),
        );
      }
      rethrow;
    }
  }
}
