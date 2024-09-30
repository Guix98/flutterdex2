import 'package:flutter_dex_2/src/config/dio/dio_client.dart';
import 'package:flutter_dex_2/src/domain/models/pokemon_details.dart';
import 'package:flutter_dex_2/src/domain/models/pokemon_list.dart';

class PokemonRepository {
  static Future<PokemonList> fetchPokemons(int offset) async {
    final response = await DioClient.get('/pokemon', queryParameters: {
      'limit': 20,
      'offset': offset,
    });
    final pokemonList = PokemonList.fromJson(response.data);

    return pokemonList;
  }

  static Future<PokemonDetails> fetchPokemonDetails(int id) async {
    final response = await DioClient.get('/pokemon/$id');
    final pokemonDetails = PokemonDetails.fromJson(response.data);

    return pokemonDetails;
  }

  static Future<PokemonDetails> fetchPokemonDetailsByName(String name) async {
    final response = await DioClient.get('/pokemon/$name');
    final pokemonDetails = PokemonDetails.fromJson(response.data);
    print(pokemonDetails.name);

    return pokemonDetails;
  }
}
