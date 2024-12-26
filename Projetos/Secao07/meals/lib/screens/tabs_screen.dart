import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //define o taotal de abas que tera na aplicacao.
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vamos Cozinhar?'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
                 Tab(
                icon: Icon(Icons.star),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          CategoriesScreen(),
          FavoriteScreen(),
        ],),
      ),
    );
  }
}
