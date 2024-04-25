import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                      labelText: '   Número a sumar o restar',
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
                  icon: SvgPicture.asset(
                    'assets/icons/addition.svg',
                    width: 30,
                    height: 30,
                  ),
                  tooltip: 'Increment',
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      int value = int.tryParse(_controller.text) ?? 0;
                      _counter -= value;
                      _controller.clear();
                    });
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/subtraction.svg',
                    width: 30,
                    height: 30,
                  ),
                  tooltip: 'Decrement',
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
          child: SvgPicture.asset(
            'assets/icons/addition.svg',
            width: 40,
            height: 40,
          ),
        ),
        //Restar al contador
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter--;
            });
          },
          tooltip: 'Decrement',
          child: SvgPicture.asset(
            'assets/icons/subtraction.svg',
            width: 40,
            height: 40,
          ),
        ),
        //Reiniciar el contador
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter = 0;
            });
          },
          tooltip: 'Reset',
          child: SvgPicture.asset(
            'assets/icons/trash.svg',
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }
}
