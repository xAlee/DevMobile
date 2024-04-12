import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Laboratorio 3'),
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
  TextEditingController _controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _subtractCounter(int value) {
    setState(() {
      _counter -= value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Has presionado el botón esta cantidad de veces.:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Número a sumar o restar',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      int value = int.tryParse(_controller.text) ?? 0;
                      _counter += value;
                      _controller.clear();
                    });
                  },
                  icon: Icon(Icons.add),
                  tooltip: 'Sumar',
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      int value = int.tryParse(_controller.text) ?? 0;
                      _counter -= value;
                      _controller.clear();
                    });
                  },
                  icon: Icon(Icons.remove),
                  tooltip: 'Restar',
                ),
              ],
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        //Sumar al contador
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        //Restar al contador
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter--;
            });
          },
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        //Reiniciar el contador
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter = 0;
            });
          },
          tooltip: 'Reset',
          child: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
