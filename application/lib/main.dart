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
  int _counter = 0;
  List<int> _numbers = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _numbers = List.generate(100, (index) => index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Builder(
            // Iconbutton�� build�� ��� contex �������� ������ ���� ���� ����
            builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              debugPrint('Menu button pressed');
              //Scaffold.of(context).openDrawer();
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
      body: HomeScreen(counter: _counter, numbers: _numbers),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required int counter,
    required List<int> numbers,
  })  : _counter = counter,
        _numbers = numbers;

  final int _counter;
  final List<int> _numbers;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          //ListView�� ���� ���� �Ҽ� �ִ� ������ �־�� ��
          //SizeBox�� height �Ӽ� �ο��ؼ� ��� ����
          //Expanded ������ ����ϸ� ���� ��ũ�� �̿��ؼ� ���� ���� ���� ��� ����
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _numbers.length,
              itemBuilder: (context, index) {
                return Text(_numbers[index].toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
