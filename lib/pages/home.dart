import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'GAMERIA',
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Laboratorio 5'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // Contador total
  TextEditingController _controller = TextEditingController();
  String _message = '';
  String _emojiImagePath =
      'assets/icons/neutral_png.png'; // Ruta de la imagen del emoji inicial

  void _updateCounter(int value, String operation) {
    setState(() {
      if (operation == 'add') {
        _counter += value;
      } else if (operation == 'subtract') {
        _counter -= value;
      }

      if (_counter == 15) {
        _emojiImagePath = 'assets/icons/happy_png.png';
        _setMessage('Victoria');
      } else if (_counter == 10) {
        _emojiImagePath = 'assets/icons/sad_png.png';
        _setMessage('Derrota');
      } else {
        _emojiImagePath = 'assets/icons/neutral_png.png';
        _setMessage('');
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
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Card(
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        _emojiImagePath, // Ruta de la imagen del emoji
                        width: 200,
                        height: 200,
                      ),
                      Text(
                        '$_counter', // Mostrar el contador del botón en lugar del contador total
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      // Nuevo widget para mostrar el mensaje de resultado
                      Text(
                        _message,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      // Espacio para separar los botones de la tarjeta
                      SizedBox(height: 20),
                      // Row para alinear los botones horizontalmente
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FloatingActionButton(
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
                          ),
                          Expanded(
                            child: FloatingActionButton(
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
                          ),
                          Expanded(
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  _counter = 0;
                                });
                              },
                              tooltip: 'Reload',
                              child: SvgPicture.asset(
                                'assets/icons/reload.svg',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Espacio en blanco para dejar la mitad inferior vacía
          SizedBox(height: MediaQuery.of(context).size.height / 6),
        ],
      ),
    );
  }
}
