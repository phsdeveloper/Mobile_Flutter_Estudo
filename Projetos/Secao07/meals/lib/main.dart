import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoriesScreen(),
    );
  }
}


/***************************************************************************************************
 *                      Anotações importantes sobre o código:                                      *
 ***************************************************************************************************
 * Aula 180. Tela de Categorias:                                                                   *
 * ● Arquivo main.dart: foi retirado a classe MyHomePage e o método main foi alterado para chamar  *
 *                      a classe CategoriesScreen, que é a nova classe que iniciará a aplicação.   *
 * ●  Arquivo categories_screen.dart: foi criado um widget que representa a tela de categorias,    *
 *                                    onde as categorias são exibidas em uma GridView.             *
 *************************************************************************************************** 
 * Aula 179. Iniciando a APP: Nessa aula foi criado o projeto e o código inicial da aplicação e    *
 * as classes Category e CategoriesScreen foram criadas, onde:                                     *
 * ● Category: é uma classe que representa uma categoria de receitas, com os atributos id, title   *
 *             e color.                                                                            *   
 * ● CategoriesScreen: é um widget que representa a tela de categorias, onde as categorias são     *
 *                    exibidas em uma GridView.                                                    *
 * ● dummyCategories: é uma lista de categorias fictícias que será exibida na tela de categorias.  *
 ***************************************************************************************************/
 
