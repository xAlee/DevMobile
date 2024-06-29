import 'package:flutter/material.dart';

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
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void navigateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    Navigator.pop(context);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laboratorio 8'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.menu),
              title: const Text('Menu'),
              onTap: () {
                navigateToPage(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Lista'),
              onTap: () {
                navigateToPage(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.details),
              title: const Text('Detalles'),
              onTap: () {
                navigateToPage(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.sensor_door),
              title: const Text('Sensores'),
              onTap: () {
                navigateToPage(3);
              },
            ),
            ListTile(
              leading: const Icon(Icons.gesture),
              title: const Text('Gestos'),
              onTap: () {
                navigateToPage(4);
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: const [
          MenuScreen(),
          HistoryScreen(),
          GameScreen(),
          SensorsScreen(),
          GesturesScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Listas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Detalle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sensor_door),
            label: 'Sensores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gesture),
            label: 'Gestos',
          ),
        ],
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Menu',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text('Item ${index + 1}'),
            onTap: () {},
          ),
        );
      },
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Juego',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class SensorsScreen extends StatelessWidget {
  const SensorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Sensores',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class GesturesScreen extends StatelessWidget {
  const GesturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Gestos',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
