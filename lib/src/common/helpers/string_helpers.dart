extension StringHelpers on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }

  String formatCamelString() {
    return split('-').map((e) => e.capitalize()).join(' ');
  }
}

extension StatHelpers on String {
  String formatStatName() {
    switch (this) {
      case 'special-attack':
        return 'Sp Atk';
      case 'special-defense':
        return 'Sp Def';
      case 'speed':
        return 'Speed';
      case 'hp':
        return 'HP';
      case 'attack':
        return 'Attack';
      case 'defense':
        return 'Defense';
      default:
        return '';
    }
  }
}
