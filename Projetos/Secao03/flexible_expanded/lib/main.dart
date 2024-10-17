import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible & Expanded',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Flexible & Expanded'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.red,
            child: const Text('Item 1 - pretty big!'),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: 100,
              color: Colors.blue,
              child: const Text('Item 2'),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Container(
              height: 100,
              color: Colors.orange,
              child: const Text('Item 3'),
            ),
          ),
        ],
      ),
    );
  }
}
