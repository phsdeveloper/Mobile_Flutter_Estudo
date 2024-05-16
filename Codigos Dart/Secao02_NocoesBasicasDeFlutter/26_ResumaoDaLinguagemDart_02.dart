void main() {
  int a = 3;
  double b = 3.1;
  var c = 'Teste de var no Dart';

  bool bl_estaChovendo = true;
  bool bl_estaFrio = false;

  print(c is String);
  print(bl_estaChovendo || bl_estaFrio);
//Listas
//Aceita repeticao

var nomes = ['Nome 01',"Nome 02",'Nome 03'];

nomes.add('Nome 04');
nomes.add('Nome 04');
nomes.add('Nome 04');
nomes.add('Nome 04');

print(nomes.length);

print(nomes.elementAt(0));
print(nomes[nomes.length -1]);
//Conjunto
//Nao aceita duplicados
Set<String> nomes_conjunto = {'Nome 01',"Nome 02",'Nome 03'};

nomes_conjunto.add('Nome 04');
nomes_conjunto.add('Nome 04');
nomes_conjunto.add('Nome 04');
nomes_conjunto.add('Nome 04');


print(nomes_conjunto.length);
print(nomes_conjunto.elementAt(0));

//Map

Map<String,int> mp_NomeIdade = 
{
  "Ana":10,
  "Joaquina":11,
  "Severina":12,
  "Maria":13
};

for(var chave in mp_NomeIdade.keys)
{
  print('Chave = $chave');
}

for(var valor in mp_NomeIdade.values)
{
  print('Valor = $valor');
}

for(var registro in mp_NomeIdade.entries)
{
  print('Chave = ${registro.key} >> Valor = ${registro.value}');
}

//dynamic,aceita qualquer coisa em qualqer etapa do codigo. é uma variavel não tipada

dynamic x = 'teste'; print('Valor de x= $x');
x = 123; print('Valor de x= $x');
x = false; print('Valor de x= $x');



}
