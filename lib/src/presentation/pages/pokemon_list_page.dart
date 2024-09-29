import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dex_2/src/presentation/widgets/flexible_title_space_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonListPage extends ConsumerStatefulWidget {
  const PokemonListPage({super.key});

  @override
  PokemonListPageState createState() => PokemonListPageState();
}

class PokemonListPageState extends ConsumerState<PokemonListPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
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
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person),
                ),
              ),
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
          ])),
          SliverList(
              delegate: SliverChildBuilderDelegate(childCount: 100,
                  (BuildContext context, int index) {
            return ListTile(
              title: Text(
                'Pokemon $index',
                style: textTheme.labelMedium,
              ),
            );
          })),
        ],
      ),
      drawer: const Drawer(
        child: Text('Drawer'),
      ),
    );
  }
}
