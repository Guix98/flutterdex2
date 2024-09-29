import 'package:flutter/material.dart';

class FlexibleTitleSpaceBar extends StatelessWidget {
  const FlexibleTitleSpaceBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var appBarHeight = constraints.biggest.height;
      var appBarExpandedHeight = 250.0;
      var t = (appBarHeight - kToolbarHeight) /
          (appBarExpandedHeight - kToolbarHeight);
      var opacity = appBarHeight > 115 ? t.clamp(0.0, 1.0) : 0.0;
      return Opacity(
        opacity: opacity,
        child: FlexibleSpaceBar(
          collapseMode: CollapseMode.none,
          centerTitle: false,
          title: Text('Encuentra Tu Pokémon', style: textTheme.displayMedium),
          titlePadding: const EdgeInsets.only(left: 16, right: 80),
        ),
      );
    });
  }
}
