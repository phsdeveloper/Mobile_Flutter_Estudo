import 'package:flutter/material.dart';

main()=> runApp(PerguntaApp());
//void main() {
//   runApp(new PerguntaApp());
//}

class PerguntaApp extends StatelessWidget {
  const PerguntaApp();

  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text('Ola teste'),
    );
  }
}
