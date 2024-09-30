// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonDetailHash() => r'6b2dca4c0bb2f49afff050de907ef4d718003736';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PokemonDetail
    extends BuildlessAutoDisposeAsyncNotifier<PokemonDetails> {
  late final int id;

  FutureOr<PokemonDetails> build(
    int id,
  );
}

/// See also [PokemonDetail].
@ProviderFor(PokemonDetail)
const pokemonDetailProvider = PokemonDetailFamily();

/// See also [PokemonDetail].
class PokemonDetailFamily extends Family<AsyncValue<PokemonDetails>> {
  /// See also [PokemonDetail].
  const PokemonDetailFamily();

  /// See also [PokemonDetail].
  PokemonDetailProvider call(
    int id,
  ) {
    return PokemonDetailProvider(
      id,
    );
  }

  @override
  PokemonDetailProvider getProviderOverride(
    covariant PokemonDetailProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pokemonDetailProvider';
}

/// See also [PokemonDetail].
class PokemonDetailProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PokemonDetail, PokemonDetails> {
  /// See also [PokemonDetail].
  PokemonDetailProvider(
    int id,
  ) : this._internal(
          () => PokemonDetail()..id = id,
          from: pokemonDetailProvider,
          name: r'pokemonDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pokemonDetailHash,
          dependencies: PokemonDetailFamily._dependencies,
          allTransitiveDependencies:
              PokemonDetailFamily._allTransitiveDependencies,
          id: id,
        );

  PokemonDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<PokemonDetails> runNotifierBuild(
    covariant PokemonDetail notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(PokemonDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: PokemonDetailProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PokemonDetail, PokemonDetails>
      createElement() {
    return _PokemonDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PokemonDetailRef on AutoDisposeAsyncNotifierProviderRef<PokemonDetails> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PokemonDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PokemonDetail,
        PokemonDetails> with PokemonDetailRef {
  _PokemonDetailProviderElement(super.provider);

  @override
  int get id => (origin as PokemonDetailProvider).id;
}

String _$pokemonDetailsSearchHash() =>
    r'2c58050c97b60a733805aaf5f4398107996c55b3';

abstract class _$PokemonDetailsSearch
    extends BuildlessAutoDisposeAsyncNotifier<PokemonDetails> {
  late final String pokemonName;

  FutureOr<PokemonDetails> build(
    String pokemonName,
  );
}

/// See also [PokemonDetailsSearch].
@ProviderFor(PokemonDetailsSearch)
const pokemonDetailsSearchProvider = PokemonDetailsSearchFamily();

/// See also [PokemonDetailsSearch].
class PokemonDetailsSearchFamily extends Family<AsyncValue<PokemonDetails>> {
  /// See also [PokemonDetailsSearch].
  const PokemonDetailsSearchFamily();

  /// See also [PokemonDetailsSearch].
  PokemonDetailsSearchProvider call(
    String pokemonName,
  ) {
    return PokemonDetailsSearchProvider(
      pokemonName,
    );
  }

  @override
  PokemonDetailsSearchProvider getProviderOverride(
    covariant PokemonDetailsSearchProvider provider,
  ) {
    return call(
      provider.pokemonName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pokemonDetailsSearchProvider';
}

/// See also [PokemonDetailsSearch].
class PokemonDetailsSearchProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PokemonDetailsSearch, PokemonDetails> {
  /// See also [PokemonDetailsSearch].
  PokemonDetailsSearchProvider(
    String pokemonName,
  ) : this._internal(
          () => PokemonDetailsSearch()..pokemonName = pokemonName,
          from: pokemonDetailsSearchProvider,
          name: r'pokemonDetailsSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pokemonDetailsSearchHash,
          dependencies: PokemonDetailsSearchFamily._dependencies,
          allTransitiveDependencies:
              PokemonDetailsSearchFamily._allTransitiveDependencies,
          pokemonName: pokemonName,
        );

  PokemonDetailsSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pokemonName,
  }) : super.internal();

  final String pokemonName;

  @override
  FutureOr<PokemonDetails> runNotifierBuild(
    covariant PokemonDetailsSearch notifier,
  ) {
    return notifier.build(
      pokemonName,
    );
  }

  @override
  Override overrideWith(PokemonDetailsSearch Function() create) {
    return ProviderOverride(
      origin: this,
      override: PokemonDetailsSearchProvider._internal(
        () => create()..pokemonName = pokemonName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pokemonName: pokemonName,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PokemonDetailsSearch, PokemonDetails>
      createElement() {
    return _PokemonDetailsSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonDetailsSearchProvider &&
        other.pokemonName == pokemonName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pokemonName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PokemonDetailsSearchRef
    on AutoDisposeAsyncNotifierProviderRef<PokemonDetails> {
  /// The parameter `pokemonName` of this provider.
  String get pokemonName;
}

class _PokemonDetailsSearchProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PokemonDetailsSearch,
        PokemonDetails> with PokemonDetailsSearchRef {
  _PokemonDetailsSearchProviderElement(super.provider);

  @override
  String get pokemonName =>
      (origin as PokemonDetailsSearchProvider).pokemonName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
