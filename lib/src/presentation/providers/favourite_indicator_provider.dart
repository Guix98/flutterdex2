import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favourite_indicator_provider.g.dart';

@riverpod
class FavouritesList extends _$FavouritesList {
  @override
  List<int> build() {
    return [];
  }

  void add(int id) {
    state = [...state, id];
  }

  void remove(int id) {
    state = state.where((element) => element != id).toList();
  }

  bool isFavourite(int id) {
    return state.contains(id);
  }
}
