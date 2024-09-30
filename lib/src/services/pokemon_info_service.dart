import 'package:flutter/material.dart';
import 'package:flutter_dex_2/src/common/domain/models/result.dart';
import 'package:flutter_dex_2/src/config/theme/tokens.dart';

class PokemonInfo {
  final int id;
  final String name;
  final String imageUrl;
  final Color backgroundColor;
  final bool isFavourite;

  PokemonInfo({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.backgroundColor,
    required this.isFavourite,
  });

  factory PokemonInfo.fromResult({
    required Result result,
    required bool isFavourite,
    required String type,
  }) {
    final id = int.parse(result.url.split('/').reversed.elementAt(1));
    return PokemonInfo(
      id: id,
      name: result.name,
      imageUrl: _getImageUrl(id),
      backgroundColor: _getBackgroundColor(type),
      isFavourite: isFavourite,
    );
  }

  static Color _getBackgroundColor(String type) {
    switch (type) {
      case 'normal':
        return PokemonTypeColors.normal;
      case 'fire':
        return PokemonTypeColors.fire;
      case 'water':
        return PokemonTypeColors.water;
      case 'electric':
        return PokemonTypeColors.electric;
      case 'grass':
        return PokemonTypeColors.grass;
      case 'ice':
        return PokemonTypeColors.ice;
      case 'fighting':
        return PokemonTypeColors.fighting;
      case 'poison':
        return PokemonTypeColors.poison;
      case 'ground':
        return PokemonTypeColors.ground;
      case 'flying':
        return PokemonTypeColors.flying;
      case 'psychic':
        return PokemonTypeColors.psychic;
      case 'bug':
        return PokemonTypeColors.bug;
      case 'rock':
        return PokemonTypeColors.rock;
      case 'ghost':
        return PokemonTypeColors.ghost;
      case 'dragon':
        return PokemonTypeColors.dragon;
      case 'dark':
        return PokemonTypeColors.dark;
      case 'steel':
        return PokemonTypeColors.steel;
      case 'fairy':
        return PokemonTypeColors.fairy;
      default:
        return Colors.black;
    }
  }

  static String _getImageUrl(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }
}
