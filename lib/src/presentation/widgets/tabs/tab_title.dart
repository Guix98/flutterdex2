import 'package:flutter/material.dart';

class TabTitle extends StatelessWidget {
  final int tabIndex;
  final int selectedIndex;
  final String label;
  final VoidCallback onTap;

  const TabTitle({
    super.key,
    required this.tabIndex,
    required this.selectedIndex,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            label,
            style: textTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
          ),
          if (selectedIndex == tabIndex)
            Container(
              height: 2,
              width: 50,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}
