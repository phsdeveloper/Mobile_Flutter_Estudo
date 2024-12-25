import 'package:flutter/material.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'Utils/app_routes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
          background: const Color.fromRGBO(255, 254, 229, 1),
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineSmall: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              color: Colors.pink,
            ),
      ),
      routes: {
        AppRoutes.home:(ctx) => const CategoriesScreen(),//Substitui o home, para que a rota '/' seja a tela inicial.
        AppRoutes.categoriesMeals: (ctx) => const CategoriesMealsScreen(),
      },
    );
  }
}


/***************************************************************************************************
 *                      Anotações importantes sobre o código:                                      *
 ***************************************************************************************************
 * Aula 187. Criando Modelo Refeição:                                                              *
 * Nesta aula foi implementado:                                                                    *
 * ● A classe Meal, que representa uma refeição, com todos atributos necessários para exibir       *
 * ● Adicionado códigos no arquivo dummy_data.dart para criar uma lista de refeições fictícias     *
 ***************************************************************************************************
 * ★ Aula 186. Rotas Nomeadas #02:                                                                 *              
 * Nessa aula foi implementado uma melhor encapsulação das rotas nomeadas, onde foi criado uma     *
 * classe AppRoutes para gerenciar as rotas nomeadas, e foi alterado o MaterialApp para utilizar   *
 * as rotas nomeadas.                                                                              *
 ***************************************************************************************************
 * ★ 185. Rotas Nomeadas #01:                                                                      *
 * Nesa aula foi implementado rotas nomeadas para navegar entre as telas da aplicação, onde foi    *
 * criado um mapa de rotas nomeadas no MaterialApp, e foi alterado o método _selectCategory para   *
 * navegar para a tela de receitas da categoria através de uma rota nomeada.                       *
 ***************************************************************************************************
 * Aula 184. Passando Dados via Construtor:                                                        *
 * Nessa aula foi alterado o construtor da classe CategoriesMealsScreen para receber um objeto da  *
 * classe Category, e foi alterado o método _selectCategory para passar o objeto da categoria para *
 * a tela de receitas da categoria.                                                                *
 ***************************************************************************************************
 * ★ Aula 183. Navegando para uma Nova Tela:                                                       *
 * Nessa aula foi criado um método para navegar para a tela de receitas de uma categoria,          *
 *  quando um card de categoria é clicado.                                                         *
 * Arquivos alterados:                                                                             *
 *  - lib/components/category_item.dart                                                            *
 *  - lib/screens/categories_meals_screen.dart                                                     *
 *  - lib/screens/categories_screen.dart                                                           *
 ***************************************************************************************************
 * ⚑ 182. Tema & Estilo                                                                            *
 * Nessa aula foi adicionado as fontes Raleway e RobotoCondensed ao tema da aplicação, e foi       *
 * alterado o esquema de cores padrão do tema.                                                     *
 *    -------------------------------------------------------------------------------------------  *
 *    --                                  Pendencias:                                          --  *
 *    -------------------------------------------------------------------------------------------  *
 *    -- 1. Verificar o porque a tela ficou azul o background.                                 --  *
 *    -- 2. Verificar o porque o app bar não ficou estilizado.                                 --  *
 *    --    R: Para essa parte é necessário adicionar o appBarTheme e indicar a cor do app bar.--  *
 *    -------------------------------------------------------------------------------------------  *
 *                                                                                                 *
 ***************************************************************************************************                                                       
 * 181. Componente Item Categoria: nessa aula foi alterado o componente CategoryItem para exibir   *
 * cada categoria em um card, com um gradiente de cores e um título.                               *
 * Ficando cada categoria em um card, com um gradiente de cores e um título.                       *
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
 
