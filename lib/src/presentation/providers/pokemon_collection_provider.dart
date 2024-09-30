import 'package:flutter_dex_2/src/common/domain/models/result.dart';
import 'package:flutter_dex_2/src/data/pokemon_repository.dart';
import 'package:flutter_dex_2/src/presentation/providers/offset_counter_provider.dart';
import 'package:flutter_dex_2/src/presentation/providers/pokemon_details_provider.dart';
import 'package:flutter_dex_2/src/services/pokemon_info_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_collection_provider.g.dart';

@riverpod
class PokemonCollection extends _$PokemonCollection {
  List<PokemonInfo> _pokemonCollection = [];
  bool _isLoadingMore = false;

  bool get isLoadingMore => _isLoadingMore;

  @override
  Future<List<PokemonInfo>> build() async {
    if (_pokemonCollection.isEmpty) {
      _pokemonCollection = await _fetchAndConvertPokemonList();
    }
    return _pokemonCollection;
  }

  Future<void> addMorePokemon() async {
    if (_isLoadingMore) return;

    _isLoadingMore = true;
    state = AsyncValue.data(_pokemonCollection);

    final newPokemonList = await _fetchMorePokemonList();
    final newPokemonInfoList = await _convertToPokemonInfoList(newPokemonList);

    _pokemonCollection.addAll(newPokemonInfoList);

    _isLoadingMore = false;
    state = AsyncValue.data(_pokemonCollection);
  }

  Future<List<PokemonInfo>> _fetchAndConvertPokemonList() async {
    final pokemonList = await _fetchPokemonList();
    return await _convertToPokemonInfoList(pokemonList);
  }

  Future<List<PokemonInfo>> _convertToPokemonInfoList(
      List<Result> pokemonList) async {
    final pokemonInfoList = pokemonList.map((e) async {
      final pokemonDetails = ref.read(pokemonDetailProvider(e.id!).future);
      final type = await pokemonDetails;
      final isFavourite = true;
      final pokemonInfo = PokemonInfo.fromResult(
          result: e,
          isFavourite: isFavourite,
          type: type.types.first.type.name);
      return pokemonInfo;
    }).toList();
    return await Future.wait(pokemonInfoList);
  }

  Future<List<Result>> _fetchPokemonList() async {
    final offset = ref.read(offsetCounterProvider);
    final response = await PokemonRepository.fetchPokemons(offset);
    return response.results;
  }

  Future<List<Result>> _fetchMorePokemonList() async {
    ref.read(offsetCounterProvider.notifier).increment();
    final offset = ref.read(offsetCounterProvider);
    final response = await PokemonRepository.fetchPokemons(offset);
    return response.results;
  }
}
