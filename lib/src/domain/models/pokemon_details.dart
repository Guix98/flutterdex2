import 'dart:convert';

import 'package:flutter_dex_2/src/common/domain/models/result.dart';

PokemonDetails pokemonDetailsFromJson(String str) =>
    PokemonDetails.fromJson(json.decode(str));

String pokemonDetailsToJson(PokemonDetails data) => json.encode(data.toJson());

class PokemonDetails {
  int id;
  String name;
  int baseExperience;
  int height;
  bool isDefault;
  int order;
  int weight;
  List<Ability> abilities;
  List<Result> forms;
  List<GameIndex> gameIndices;
  String locationAreaEncounters;
  List<Move> moves;
  Species species;
  Sprites sprites;
  Cries cries;
  List<Stat> stats;
  List<Type> types;

  PokemonDetails({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.abilities,
    required this.forms,
    required this.gameIndices,
    required this.locationAreaEncounters,
    required this.moves,
    required this.species,
    required this.sprites,
    required this.cries,
    required this.stats,
    required this.types,
  });

  PokemonDetails copyWith({
    int? id,
    String? name,
    int? baseExperience,
    int? height,
    bool? isDefault,
    int? order,
    int? weight,
    List<Ability>? abilities,
    List<Result>? forms,
    List<GameIndex>? gameIndices,
    String? locationAreaEncounters,
    List<Move>? moves,
    Species? species,
    Sprites? sprites,
    Cries? cries,
    List<Stat>? stats,
    List<Type>? types,
  }) =>
      PokemonDetails(
        id: id ?? this.id,
        name: name ?? this.name,
        baseExperience: baseExperience ?? this.baseExperience,
        height: height ?? this.height,
        isDefault: isDefault ?? this.isDefault,
        order: order ?? this.order,
        weight: weight ?? this.weight,
        abilities: abilities ?? this.abilities,
        forms: forms ?? this.forms,
        gameIndices: gameIndices ?? this.gameIndices,
        locationAreaEncounters:
            locationAreaEncounters ?? this.locationAreaEncounters,
        moves: moves ?? this.moves,
        species: species ?? this.species,
        sprites: sprites ?? this.sprites,
        cries: cries ?? this.cries,
        stats: stats ?? this.stats,
        types: types ?? this.types,
      );

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => PokemonDetails(
        id: json["id"],
        name: json["name"],
        baseExperience: json["base_experience"],
        height: json["height"],
        isDefault: json["is_default"],
        order: json["order"],
        weight: json["weight"],
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        forms: List<Result>.from(json["forms"].map((x) => Result.fromJson(x))),
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromJson(x))),
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        cries: Cries.fromJson(json["cries"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "base_experience": baseExperience,
        "height": height,
        "is_default": isDefault,
        "order": order,
        "weight": weight,
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "species": species.toJson(),
        "sprites": sprites.toJson(),
        "cries": cries.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
      };
}

class Ability {
  bool isHidden;
  int slot;
  Result ability;

  Ability({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  Ability copyWith({
    bool? isHidden,
    int? slot,
    Result? ability,
  }) =>
      Ability(
        isHidden: isHidden ?? this.isHidden,
        slot: slot ?? this.slot,
        ability: ability ?? this.ability,
      );

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        isHidden: json["is_hidden"],
        slot: json["slot"],
        ability: Result.fromJson(json["ability"]),
      );

  Map<String, dynamic> toJson() => {
        "is_hidden": isHidden,
        "slot": slot,
        "ability": ability.toJson(),
      };
}

class Species {
  String name;
  String url;

  Species({
    required this.name,
    required this.url,
  });

  Result copyWith({
    String? name,
    String? url,
  }) =>
      Result(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Cries {
  String latest;
  String legacy;

  Cries({
    required this.latest,
    required this.legacy,
  });

  Cries copyWith({
    String? latest,
    String? legacy,
  }) =>
      Cries(
        latest: latest ?? this.latest,
        legacy: legacy ?? this.legacy,
      );

  factory Cries.fromJson(Map<String, dynamic> json) => Cries(
        latest: json["latest"],
        legacy: json["legacy"],
      );

  Map<String, dynamic> toJson() => {
        "latest": latest,
        "legacy": legacy,
      };
}

class GameIndex {
  int gameIndex;
  Result version;

  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  GameIndex copyWith({
    int? gameIndex,
    Result? version,
  }) =>
      GameIndex(
        gameIndex: gameIndex ?? this.gameIndex,
        version: version ?? this.version,
      );

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Result.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "version": version.toJson(),
      };
}

class Move {
  Result move;
  List<VersionGroupDetail> versionGroupDetails;

  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  Move copyWith({
    Result? move,
    List<VersionGroupDetail>? versionGroupDetails,
  }) =>
      Move(
        move: move ?? this.move,
        versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
      );

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Result.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(
            json["version_group_details"]
                .map((x) => VersionGroupDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "move": move.toJson(),
        "version_group_details":
            List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
      };
}

class VersionGroupDetail {
  int levelLearnedAt;
  Result versionGroup;
  Result moveLearnMethod;

  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.versionGroup,
    required this.moveLearnMethod,
  });

  VersionGroupDetail copyWith({
    int? levelLearnedAt,
    Result? versionGroup,
    Result? moveLearnMethod,
  }) =>
      VersionGroupDetail(
        levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
        versionGroup: versionGroup ?? this.versionGroup,
        moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
      );

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        versionGroup: Result.fromJson(json["version_group"]),
        moveLearnMethod: Result.fromJson(json["move_learn_method"]),
      );

  Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "version_group": versionGroup.toJson(),
        "move_learn_method": moveLearnMethod.toJson(),
      };
}

class Type {
  int slot;
  Result type;

  Type({
    required this.slot,
    required this.type,
  });

  Type copyWith({
    int? slot,
    Result? type,
  }) =>
      Type(
        slot: slot ?? this.slot,
        type: type ?? this.type,
      );

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Result.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}

class GenerationV {
  Sprites blackWhite;

  GenerationV({
    required this.blackWhite,
  });

  GenerationV copyWith({
    Sprites? blackWhite,
  }) =>
      GenerationV(
        blackWhite: blackWhite ?? this.blackWhite,
      );

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: Sprites.fromJson(json["black-white"]),
      );

  Map<String, dynamic> toJson() => {
        "black-white": blackWhite.toJson(),
      };
}

class GenerationIv {
  Sprites diamondPearl;
  Sprites heartgoldSoulsilver;
  Sprites platinum;

  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  GenerationIv copyWith({
    Sprites? diamondPearl,
    Sprites? heartgoldSoulsilver,
    Sprites? platinum,
  }) =>
      GenerationIv(
        diamondPearl: diamondPearl ?? this.diamondPearl,
        heartgoldSoulsilver: heartgoldSoulsilver ?? this.heartgoldSoulsilver,
        platinum: platinum ?? this.platinum,
      );

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: Sprites.fromJson(json["diamond-pearl"]),
        heartgoldSoulsilver: Sprites.fromJson(json["heartgold-soulsilver"]),
        platinum: Sprites.fromJson(json["platinum"]),
      );

  Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver.toJson(),
        "platinum": platinum.toJson(),
      };
}

class Versions {
  GenerationI generationI;
  GenerationIi generationIi;
  GenerationIii generationIii;
  GenerationIv generationIv;
  GenerationV generationV;
  Map<String, Home> generationVi;
  GenerationVii generationVii;
  GenerationViii generationViii;

  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  Versions copyWith({
    GenerationI? generationI,
    GenerationIi? generationIi,
    GenerationIii? generationIii,
    GenerationIv? generationIv,
    GenerationV? generationV,
    Map<String, Home>? generationVi,
    GenerationVii? generationVii,
    GenerationViii? generationViii,
  }) =>
      Versions(
        generationI: generationI ?? this.generationI,
        generationIi: generationIi ?? this.generationIi,
        generationIii: generationIii ?? this.generationIii,
        generationIv: generationIv ?? this.generationIv,
        generationV: generationV ?? this.generationV,
        generationVi: generationVi ?? this.generationVi,
        generationVii: generationVii ?? this.generationVii,
        generationViii: generationViii ?? this.generationViii,
      );

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromJson(json["generation-i"]),
        generationIi: GenerationIi.fromJson(json["generation-ii"]),
        generationIii: GenerationIii.fromJson(json["generation-iii"]),
        generationIv: GenerationIv.fromJson(json["generation-iv"]),
        generationV: GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"])
            .map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
        generationVii: GenerationVii.fromJson(json["generation-vii"]),
        generationViii: GenerationViii.fromJson(json["generation-viii"]),
      );

  Map<String, dynamic> toJson() => {
        "generation-i": generationI.toJson(),
        "generation-ii": generationIi.toJson(),
        "generation-iii": generationIii.toJson(),
        "generation-iv": generationIv.toJson(),
        "generation-v": generationV.toJson(),
        "generation-vi": Map.from(generationVi)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "generation-vii": generationVii.toJson(),
        "generation-viii": generationViii.toJson(),
      };
}

class Other {
  DreamWorld dreamWorld;
  Home home;
  OfficialArtwork officialArtwork;
  Sprites showdown;

  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
    required this.showdown,
  });

  Other copyWith({
    DreamWorld? dreamWorld,
    Home? home,
    OfficialArtwork? officialArtwork,
    Sprites? showdown,
  }) =>
      Other(
        dreamWorld: dreamWorld ?? this.dreamWorld,
        home: home ?? this.home,
        officialArtwork: officialArtwork ?? this.officialArtwork,
        showdown: showdown ?? this.showdown,
      );

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
        home: Home.fromJson(json["home"]),
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
        showdown: Sprites.fromJson(json["showdown"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld.toJson(),
        "home": home.toJson(),
        "official-artwork": officialArtwork.toJson(),
        "showdown": showdown.toJson(),
      };
}

class Sprites {
  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;
  Other? other;
  Versions? versions;
  Sprites? animated;

  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  Sprites copyWith({
    String? backDefault,
    dynamic backFemale,
    String? backShiny,
    dynamic backShinyFemale,
    String? frontDefault,
    dynamic frontFemale,
    String? frontShiny,
    dynamic frontShinyFemale,
    Other? other,
    Versions? versions,
    Sprites? animated,
  }) =>
      Sprites(
        backDefault: backDefault ?? this.backDefault,
        backFemale: backFemale ?? this.backFemale,
        backShiny: backShiny ?? this.backShiny,
        backShinyFemale: backShinyFemale ?? this.backShinyFemale,
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
        other: other ?? this.other,
        versions: versions ?? this.versions,
        animated: animated ?? this.animated,
      );

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
        versions: json["versions"] == null
            ? null
            : Versions.fromJson(json["versions"]),
        animated: json["animated"] == null
            ? null
            : Sprites.fromJson(json["animated"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other?.toJson(),
        "versions": versions?.toJson(),
        "animated": animated?.toJson(),
      };
}

class GenerationI {
  RedBlue redBlue;
  RedBlue yellow;

  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  GenerationI copyWith({
    RedBlue? redBlue,
    RedBlue? yellow,
  }) =>
      GenerationI(
        redBlue: redBlue ?? this.redBlue,
        yellow: yellow ?? this.yellow,
      );

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromJson(json["red-blue"]),
        yellow: RedBlue.fromJson(json["yellow"]),
      );

  Map<String, dynamic> toJson() => {
        "red-blue": redBlue.toJson(),
        "yellow": yellow.toJson(),
      };
}

class RedBlue {
  String backDefault;
  String backGray;
  String frontDefault;
  String frontGray;

  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.frontDefault,
    required this.frontGray,
  });

  RedBlue copyWith({
    String? backDefault,
    String? backGray,
    String? frontDefault,
    String? frontGray,
  }) =>
      RedBlue(
        backDefault: backDefault ?? this.backDefault,
        backGray: backGray ?? this.backGray,
        frontDefault: frontDefault ?? this.frontDefault,
        frontGray: frontGray ?? this.frontGray,
      );

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "front_default": frontDefault,
        "front_gray": frontGray,
      };
}

class GenerationIi {
  Crystal crystal;
  Crystal gold;
  Crystal silver;

  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  GenerationIi copyWith({
    Crystal? crystal,
    Crystal? gold,
    Crystal? silver,
  }) =>
      GenerationIi(
        crystal: crystal ?? this.crystal,
        gold: gold ?? this.gold,
        silver: silver ?? this.silver,
      );

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromJson(json["crystal"]),
        gold: Crystal.fromJson(json["gold"]),
        silver: Crystal.fromJson(json["silver"]),
      );

  Map<String, dynamic> toJson() => {
        "crystal": crystal.toJson(),
        "gold": gold.toJson(),
        "silver": silver.toJson(),
      };
}

class Crystal {
  String backDefault;
  String backShiny;
  String frontDefault;
  String frontShiny;

  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
  });

  Crystal copyWith({
    String? backDefault,
    String? backShiny,
    String? frontDefault,
    String? frontShiny,
  }) =>
      Crystal(
        backDefault: backDefault ?? this.backDefault,
        backShiny: backShiny ?? this.backShiny,
        frontDefault: frontDefault ?? this.frontDefault,
        frontShiny: frontShiny ?? this.frontShiny,
      );

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class GenerationIii {
  OfficialArtwork emerald;
  Crystal fireredLeafgreen;
  Crystal rubySapphire;

  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  GenerationIii copyWith({
    OfficialArtwork? emerald,
    Crystal? fireredLeafgreen,
    Crystal? rubySapphire,
  }) =>
      GenerationIii(
        emerald: emerald ?? this.emerald,
        fireredLeafgreen: fireredLeafgreen ?? this.fireredLeafgreen,
        rubySapphire: rubySapphire ?? this.rubySapphire,
      );

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: OfficialArtwork.fromJson(json["emerald"]),
        fireredLeafgreen: Crystal.fromJson(json["firered-leafgreen"]),
        rubySapphire: Crystal.fromJson(json["ruby-sapphire"]),
      );

  Map<String, dynamic> toJson() => {
        "emerald": emerald.toJson(),
        "firered-leafgreen": fireredLeafgreen.toJson(),
        "ruby-sapphire": rubySapphire.toJson(),
      };
}

class OfficialArtwork {
  String frontDefault;
  String frontShiny;

  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  OfficialArtwork copyWith({
    String? frontDefault,
    String? frontShiny,
  }) =>
      OfficialArtwork(
        frontDefault: frontDefault ?? this.frontDefault,
        frontShiny: frontShiny ?? this.frontShiny,
      );

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  Home({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  Home copyWith({
    String? frontDefault,
    dynamic frontFemale,
    String? frontShiny,
    dynamic frontShinyFemale,
  }) =>
      Home(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
      );

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class GenerationVii {
  DreamWorld icons;
  Home ultraSunUltraMoon;

  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  GenerationVii copyWith({
    DreamWorld? icons,
    Home? ultraSunUltraMoon,
  }) =>
      GenerationVii(
        icons: icons ?? this.icons,
        ultraSunUltraMoon: ultraSunUltraMoon ?? this.ultraSunUltraMoon,
      );

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromJson(json["icons"]),
        ultraSunUltraMoon: Home.fromJson(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon.toJson(),
      };
}

class DreamWorld {
  String frontDefault;
  dynamic frontFemale;

  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });

  DreamWorld copyWith({
    String? frontDefault,
    dynamic frontFemale,
  }) =>
      DreamWorld(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
      );

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class GenerationViii {
  DreamWorld icons;

  GenerationViii({
    required this.icons,
  });

  GenerationViii copyWith({
    DreamWorld? icons,
  }) =>
      GenerationViii(
        icons: icons ?? this.icons,
      );

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromJson(json["icons"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
      };
}

class Stat {
  int baseStat;
  int effort;
  Result stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  Stat copyWith({
    int? baseStat,
    int? effort,
    Result? stat,
  }) =>
      Stat(
        baseStat: baseStat ?? this.baseStat,
        effort: effort ?? this.effort,
        stat: stat ?? this.stat,
      );

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Result.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}
