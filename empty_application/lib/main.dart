import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            //child: Text('Hello World!'),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Hello World!'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Hello World!'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Hello World!'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.menu),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
