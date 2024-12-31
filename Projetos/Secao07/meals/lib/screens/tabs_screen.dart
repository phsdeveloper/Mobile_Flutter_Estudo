import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favorite_screen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoriteMeals,{super.key});
  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


  int selectedScreenIndex = 0;  
   List<Map<String,Object>>? _screens; //= [
  //   {'title': 'Lista de Categorias', 'screen': const CategoriesScreen()},
  //   {'title': 'Meus Favoritos', 'screen': const FavoriteScreen()},
  // ];

  @override
  void initState() {
    super.initState();
    _screens = [
    {'title': 'Lista de Categorias', 'screen': const CategoriesScreen()},
    {'title': 'Meus Favoritos', 'screen': FavoriteScreen(widget.favoriteMeals)},
  ];
  }

  void _selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens![selectedScreenIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _screens![selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: selectedScreenIndex,
        //type: BottomNavigationBarType.shifting, //Adiciona uma forma diferente de exibir o item selecionado e o nao selecionado
        items:  const [ //Caso o type seja shifting, é necessario retirar o const daqui
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor, // Caso o type seja shifting, é necessario adicionar a cor de fundo em cada item
            icon:  Icon(Icons.category),
            label: 'Categorias',
          ),
             BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor, // Caso o type seja shifting, é necessario adicionar a cor de fundo em cada item
            icon:  Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
