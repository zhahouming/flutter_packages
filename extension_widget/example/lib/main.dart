import 'package:flutter/material.dart';
import 'package:extension_widget/extension_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double size = 50;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                size = 100;
              });
            },
            child: const Text('size 100'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                size = 50;
              });
            },
            child: const Text('size 50'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            )
                .div(
                    DivStyle(
                      width: size,
                      height: size,
                      backgroundColor: Colors.grey,
                      alignment: Alignment.center,
                      radiusAll: 25,
                    ),
                    true)
                .div(DivStyle(
                  paddingAll: 10,
                  backgroundColor: Colors.blue,
                  radiusAll: 50,
                ))
                .div(DivStyle(
                    marginAll: 10, border: Border.all(color: Colors.green)))
                .div(DivStyle(
                  paddingAll: 10,
                  backgroundColor: Colors.red,
                  radiusAll: 100,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
