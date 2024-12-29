import 'package:flutter/material.dart';
import 'screens/categories_meals_screen.dart';
import 'Utils/app_routes.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/tabs_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';
import '../models/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = dummyMeals;
Settings settings = Settings();


  void filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

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
        AppRoutes.home: (ctx) =>
            const TabsScreen(), //Substitui o home, para que a rota '/' seja a tela inicial.
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDetail: (ctx) => const MealDetailScreen(),
        AppRoutes.settings: (ctx) => SettingsScreen(filterMeals, settings),
      },
    );
  }
}


/***************************************************************************************************
 *                      Anotações importantes sobre o código:                                      *
 ***************************************************************************************************
 * ★★⚑ Aula 206. Filtrando os Dados #03:                                                            *
 * Nesta aula foi implementado a persistencia dos dados selacionados para realizar o filtro nas    *
 * refeições.                                                                                      *
 * Arquivos alterados:                                                                             *
 *  - lib/main.dart                                                                                *
 *    - Neste arquivo foi adicionado uma variavel do tipo Settings para armazenar as configurações *
 *      selecionadas.                                                                              *
 *    - Na função filterMeals foi adicionado a variavel settings para armazenar as configurações   *
 *      e atualizar o estado da tela.                                                              *
 *  - lib/models/settings.dart                                                                     *
 *     - Nesse arquivo foi adicionado uma propriedade chamada settings que é do tipo Settings.     *
 *       que será alimentada diretamente pelo parametro passado no construtor da classe.           *
 *     - Na classe _SettingsScreenState foi feito um override no metodo initState para inicializar *
 *       a variavel settings com o valor passado no construtor.                                    * 
 *                                                                                                 *
 * ⚑ Pesquisar mais sobre o estado em flutter.                                                     * 
 ***************************************************************************************************
 * ★ Aula 205. Filtrando os Dados #02:                                                             *
 * Nessa aula foi implementado a filtragem dos dados e para isso foi realizado as seguintes        *
 * alterações:                                                                                     *
 * - Arquivo main.dart:                                                                            *
 *   - Foi criado um método filterMeals que recebe um objeto da classe Settings e filtra as        *
 *     refeições.                                                                                  *
 * - Arquivo settings_screen.dart:                                                                 *
 *   - foi criado a referencia a uma função chamada onSettingsChanged que vai receber via          *
 *     construtor uma função que irá filtrar as refeições de acordo com as configurações.          *
 ***************************************************************************************************
 * Aula 203. Filtrando os Dados #01:                                                               *
 * Nessa aula foi inicializado as alterações necessárias para a implementação dos filtros          *
 * e para isso as seguintes alterações foram feitas:                                               *
 * - Arquivo main.dart:
 *  - Foi modificado de StatefulWidget para StatelessWidget, pois não há necessidade de ter estado *
 *    para a aplicação.                                                                            *
 *  - Foi criado uma lista de refeições disponíveis, que irá conter as refeições de acordo com o   * 
 *    filtro selecionado.                                                                          *
 *  - Arquivo caregorias_meals_screen.dart:                                                        *
 *    - foi adicionado no construtor da classe CategoriesMealsScreen um parâmetro meals, que       *
 *      representa a lista de refeições de acordo com o(s) filtro(s) selecionado(s).               *
 ***************************************************************************************************
 * Aula 202. Tela de Configurações:                                                                *
 * Incio do desenvolvimento dos filtos da tela de configuração.                                    *
 * Nesta aul doi implementado um método para criar e salvar o estado de cada selecao de filtro.    *
 * Entretanto ainda esta apenas no layout, sem funcionalidade.                                     *
 * arquivos alterados:                                                                             *
 * - lib/screens/settings_screen.dart                                                              *
 * - lib/components/main_drawer.dart                                                               *
 * - models/settings.dart                                                                          *
 ***************************************************************************************************
 * ★ 201. Fechando a Tela & Passando Dados de Volta:                                               *
 * Nesta aula foi implementado uma forma de obter os dados da tela que está em primeiro plano,     *
 * para a tela que está em segundo plano.                                                          *
 * Isso é possível pois o método pushNamed retorna um Future, onde é possível aguardar que a tela  *
 * em primeiro plano seja fechada.                                                                 *
 * Arquivos alterados:                                                                             *
 * - lib/components/meal_item.dart                                                                 *
 * - lib/screens/categories_meals_screen.dart                                                      *
 ***************************************************************************************************
 * ★ Aula 200. Substituindo Telas:                                                                 *
 * Nesta aula foi implementado o método pushReplacementNamed para substituir a tela atual pela     *
 * tela que foi selecionada no menu lateral.                                                       *
 * Diferente do pushNamed que empilha a tela atual e a nova tela, o pushReplacementNamed substitui *
 * a tela atual pela nova tela.                                                                    *
 * Evitando que tenhamos muitas telas empilhadas sem necessidade.                                  *
 ***************************************************************************************************
 * Aula 199. Adicionando Links no Drawer:                                                          *
 * Nesta aula foi implementado a navegação entre as telas através do menu lateral, onde foi        *
 * adicionado um método para navegar para a tela de configurações juntamente com as rotas.         *
 ***************************************************************************************************
 * ★ Aula 198. Adicionar Drawer Personalizado:                                                     *
 * Nessa aula foi implementado o menu lateral personalizado.                                       *
 * Foi criado um novo widget chamado MainDrawer, que é um widget que representa o menu lateral da  *
 * aplicação, onde foi adicionado um Drawer para exibir o menu lateral.                            *
 * Foi adicionado um ListTile para exibir os itens do menu lateral.                                *
 ***************************************************************************************************
 * ★ 197. Adicionar TabBar na Parte Inferior:                                                      *
 * Nesta aula foi implementado a navegação na parte inferior da tela.                              *
 * - Retirou boa parte do coódigo da aula passsada.                                                *
 * - Foi mostrado como adicionar uma forma diferente de navegar entre as abas onde o nome da aba   *
 *  aparece apnas na que esta selecionada.                                                         *
 ***************************************************************************************************
 * ★ Aula 195. Adicionando TabBar na AppBar:                                                       *
 * Nesta aula foi inciado a implementação das abas no AppBar.                                      *
 * Foi criado um novo widget chamado TabsScreen, que é um widget que representa a tela principal   *
 * da aplicação, onde as abas são exibidas na AppBar.                                              *
 * Foi adicionado um DefaultTabController para gerenciar as abas, e foi adicionado um TabBar na    *
 * AppBar para exibir as abas.                                                                     *
 * Foi adicionado um TabBarView para exibir o conteúdo de cada aba.                                *
 * Foi retirado o Scaffold da tela categories_screen.dart pois ela não é mais a pagina home        *
 ***************************************************************************************************
 * Aula 194. Tela Detalhe Refeição #02:                                                            *
 * Nessa aula foi implementado a encapulação dos widgets que servem para exibir os ingredientes e  *
 * o titulo do bloco (Ingredientes e passos).                                                      *
 * Foi adicionado tambem o widget SingleChildScrollView para que tenha rolagem na tela.            *
 ***************************************************************************************************
 * ★ Aula 193. Tela Detalhe Refeição #01:                                                          *
 * Nessa aula foi implementado a tela de detalhes da refeição com as seguintes implementações:     *
 * Adicionado a imagem da refeição, os ingredientes e o passo a passo da refeição.                 *
 ***************************************************************************************************
 * ★ ⚑ Aula 192. onGenerateRoute & onUnknownRoute:                                                 *
 * Nessa aula foi apresentado duas opções para lidar com rotas desconhecidas                       *
 * ● onGenerateRoute: é uma função que é chamada quando uma rota nomeada é chamada, mas não foi    *
 *                    definida no atributo routes do MaterialApp.                                  *
 * ● onUnknownRoute: é uma função que é chamada quando uma rota nomeada é chamada, mas não foi     *
 *                   definida no atributo routes e nem no onGenerateRoute do MaterialApp.          *
 * Ideal para quando há a necessidade de ter um redirecionamento para uma tela padrão, quando      *
 * uma rota não cadastrada é chamada.                                                              *
 * Mas não acho bacana colocar para a tela inicial, pois acaba ficando na pilha, ver depois se     *
 * tem como limpar a pilha de chamadas e deixar apenas a tela inicial.                             *
 ***************************************************************************************************
 * Aula 191. Navegando para Tela de Detalhe da Refeição:                                           *
 * Nessa aula foi implementado a tela de detalhes da refeição e a navegação para essa tela, onde   *
 * foi criado o componente MealDetailScreen, que exibe o título da refeição na app bar e um texto  *
 * na tela.                                                                                        *
 ***************************************************************************************************
 * Aula ★ 190. Componente Item Refeição #02:                                                       *
 * Nesta aula foi implemantado mais elementos no componente MealItem, como a duração, complexidade *
 * e custo da refeição, e foi adicionado um gradiente sobre o texto da refeição para melhorar a    *
 * visualização.                                                                                   *
 ***************************************************************************************************
 * ★ Aula 189. Componente Item Refeição #01:                                                       *
 * Nessa aula foi iniciado a eleboracao do componente MealItem, que representa um item de refeição,*
 * onde foi implementado a exibição da imagem da refeição, e foi adicionado um gradiente sobre a   *
 * imagem para melhorar a visualização.                                                            *
 ***************************************************************************************************
 * ★ 188. Selecionando Refeições por Categoria                                                     *
 * Nesta aula foi implementado:                                                                    *
 * ● No arquivo categorry_meals_screen.dart: foi implementado a obtencao dos alimentos que fazem   *
 *  parte da categoria selecionada, e foi implementado um ListView para exibir apenas o titulo dos *
 * alimentos                                                                                       *
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
 
