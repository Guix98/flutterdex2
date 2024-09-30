import 'package:flutter_dex_2/src/data/pokemon_repository.dart';
import 'package:flutter_dex_2/src/domain/models/pokemon_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_details_provider.g.dart';

@riverpod
class PokemonDetail extends _$PokemonDetail {
  @override
  Future<PokemonDetails> build(int id) async {
    final details = await PokemonRepository.fetchPokemonDetails(id);
    return details;
  }
}

@riverpod
class PokemonDetailsSearch extends _$PokemonDetailsSearch {
  @override
  Future<PokemonDetails> build(String pokemonName) async {
    final details =
        await PokemonRepository.fetchPokemonDetailsByName(pokemonName);
    return details;
  }
}
