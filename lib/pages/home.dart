import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // Contador total
  int _buttonCounter =
      0; // Contador para "Has presionado el botón esta cantidad de veces"
  TextEditingController _controller = TextEditingController();
  String _message = '';
  String _emojiImagePath =
      'assets/icons/neutral_png.png'; // Ruta de la imagen del emoji inicial

  void _updateCounter(int value, String operation) {
    setState(() {
      if (operation == 'add') {
        _counter += value;
        _buttonCounter += value; // Incrementa el contador del botón
        _setMessage('Se sumó $value al contador. Total: $_counter');
      } else if (operation == 'subtract') {
        _counter -= value;
        _buttonCounter += value; // Incrementa el contador del botón
        _setMessage('Se restó $value al contador. Total: $_counter');
      }

      // Actualizar la ruta de la imagen del emoji en función del valor del puntaje resultado
      if (_counter > 15) {
        _emojiImagePath = 'assets/icons/happy_png.png';
      } else if (_counter >= 0) {
        _emojiImagePath = 'assets/icons/neutral_png.png';
      } else {
        _emojiImagePath = 'assets/icons/sad_png.png';
      }
    });
  }

  void _setMessage(String message) {
    setState(() {
      _message = message;
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
            Image.asset(
              _emojiImagePath, // Ruta de la imagen del emoji
              width: 200,
              height: 200,
            ),
            const Text(
              'Has presionado el botón esta cantidad de veces.:',
            ),
            Text(
              '$_buttonCounter', // Mostrar el contador del botón en lugar del contador total
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
                    int value = int.tryParse(_controller.text) ?? 0;
                    _controller.clear();
                    _updateCounter(value, 'add');
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
                    int value = int.tryParse(_controller.text) ?? 0;
                    _controller.clear();
                    _updateCounter(value, 'subtract');
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
            // Nuevo widget para mostrar el mensaje de resultado
            Text(
              _message,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        // Sumar al contador
        FloatingActionButton(
          onPressed: () {
            _updateCounter(1, 'add');
          },
          tooltip: 'Increment',
          child: SvgPicture.asset(
            'assets/icons/addition.svg',
            width: 40,
            height: 40,
          ),
        ),
        // Restar al contador
        FloatingActionButton(
          onPressed: () {
            _updateCounter(1, 'subtract');
          },
          tooltip: 'Decrement',
          child: SvgPicture.asset(
            'assets/icons/subtraction.svg',
            width: 40,
            height: 40,
          ),
        ),
        // Reiniciar el contador del botón
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _buttonCounter = 0; // Reiniciar el contador del botón
              _setMessage(
                  'Se reinició el contador de presiones de botón. Total: $_counter');
            });
          },
          tooltip: 'Reset',
          child: SvgPicture.asset(
            'assets/icons/trash.svg',
            width: 40,
            height: 40,
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _buttonCounter = 0;
              _counter = 0;
              _setMessage('Se reinició todo. Total: $_counter');
            });
          },
          tooltip: 'Reload',
          child: SvgPicture.asset(
            'assets/icons/reload.svg',
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }
}
