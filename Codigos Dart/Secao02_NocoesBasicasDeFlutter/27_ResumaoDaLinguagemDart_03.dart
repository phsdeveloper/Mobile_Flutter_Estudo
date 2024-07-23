

int MTD_Soma(int a, int b) {
  return a + b;
}

void MTD_Soma2(int a, int b, int c) {
  print('MTD_Soma2 >> A soma dos valores $a + $b + $c = ${a + b + c}');
}

int MTD_exec(int a, int b, int Function(int, int, int) fn) {
  int it_valorSoma = a + b;
  print('Metodo Exec >> A soma dos valores $a + $b = ${a + b}');
  return fn(a, b, it_valorSoma);
}

void main(List<String> args) {
  int retono = MTD_Soma(2, 3);
  print('MTD_Soma >> O valor da soma é $retono');

  MTD_Soma2(1, 3, 7);

  final resultado = MTD_exec(10, 20, (p0, p1, p2) {
    int it_resultado = (p0 + p1) * p2;
    print('Funcao >> ($p0 + $p1) * $p2 = $it_resultado');
    return it_resultado;
  });
  print('Resultado Funcao >> $resultado');

//fat arrow (=>) function
//Esta abordagem a funcao nao tem corpo,
  final resultado2 = MTD_exec(10, 30, (p0, p1, p2) => (p0 + p1) * p2);
  print('Resulado da funcao 02 >> $resultado2');

  produto p1 = new produto();
  p1.nome = "lapis";
  p1.preco = 4.59;

  print("O valor do ${p1.nome} é R\$ ${p1.preco}");


  produto2 p2 = new produto2('Caderno',12.30);
    print("O valor do ${p2.nome} é R\$ ${p2.preco}");

  produto3 p3 = new produto3('Livro',13.30);
    print("O valor do ${p3.nome} é R\$ ${p3.preco}");

  produto4 p4 = new produto4(nome:'papel',preco:14.40);
    print("O valor do ${p4.nome} é R\$ ${p4.preco}");
}

class produto {
  String nome = '';
  double preco = 0;
}

class produto2 {
  produto2(String Paramnome, double Parampreco) {
    this.nome = Paramnome;
    this.preco = Parampreco;
  }

  String nome = "";
  double preco = 0;
}

class produto3 {
  //Parametros posicionais
  produto3(this.nome, this.preco);

  String nome = "";
  double preco = 0;
}

class produto4 {
  //Parametros posicionais
  produto4({required this.nome,required this.preco});
  String nome = "";
  double preco = 0;
}