import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';
import 'screens/color_box_list.dart';
import 'screens/input_widgets.dart';

import 'models/increment_counter.dart';
import 'models/integer_list_generator.dart';

void main() {
  //runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Counter(),
        ),
        ChangeNotifierProvider(
          create: (context) => IntegerListGenerator(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  late Widget _currentScreen;
  late Widget homeScreen;
  late Widget settingsScreen;
  late Widget inputWidgetsScreen;

  @override
  void initState() {
    super.initState();
    homeScreen = HomeScreen();
    settingsScreen = ColorBoxList();
    inputWidgetsScreen = InputWidgets();
    _currentScreen = homeScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Builder(
            // Iconbutton을 build로 묶어서 contex 전달하지 않으면 실행 되지 않음
            builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              debugPrint('Menu button pressed');
              Scaffold.of(context).openDrawer();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Menu button pressed'),
                ),
              );
            },
          );
        }),
        title: Text(widget.title),
      ),
      body: _currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.window), label: 'ColorBox'),
          BottomNavigationBarItem(icon: Icon(Icons.input), label: 'Input'),
        ],
        onTap: (index) {
          setState(() {
            if (index == 0) {
              _currentScreen = homeScreen;
            } else if (index == 1) {
              _currentScreen = settingsScreen;
            } else if (index == 2) {
              _currentScreen = inputWidgetsScreen;
            } else {
              _currentScreen = homeScreen;
            }
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                debugPrint('Item 1 pressed');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //var counter = Provider.of<Counter>(context, listen: false);
          var counter = context.read<Counter>();
          counter.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
