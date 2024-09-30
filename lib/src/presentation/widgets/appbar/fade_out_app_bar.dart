import 'package:flutter/material.dart';
import 'package:flutter_dex_2/src/presentation/widgets/appbar/flexible_title_space_bar.dart';

class FadeOutAppBar extends StatelessWidget {
  const FadeOutAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      pinned: true,
      expandedHeight: 250.0,
      flexibleSpace: const FlexibleTitleSpaceBar(),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person),
          ),
        ),
      ],
    );
  }
}
