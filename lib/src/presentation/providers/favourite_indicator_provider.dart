import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favourite_indicator_provider.g.dart';

@Riverpod(keepAlive: true)
class FavouritesList extends _$FavouritesList {
  List<int> favourites = [];

  @override
  List<int> build() {
    return favourites;
  }

  void add(int id) {
    state = [...state, id];
    favourites = state;
  }

  void remove(int id) {
    state = state.where((element) => element != id).toList();
    favourites = state;
  }

  bool isFavourite(int id) {
    return state.contains(id);
  }

  void toggle(int id) {
    if (isFavourite(id)) {
      remove(id);
    } else {
      add(id);
    }
  }
}
