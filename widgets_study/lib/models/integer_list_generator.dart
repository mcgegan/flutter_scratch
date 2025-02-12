import 'package:flutter/material.dart';
import 'dart:math';

class IntegerListGenerator with ChangeNotifier {
  List<int> numbers = [];

  void initState() {
    numbers = List.generate(100, (index) => Random().nextInt(1000));
  }

  void generateNumbers() {
    numbers = List.generate(100, (index) => Random().nextInt(1000));
    notifyListeners();
  }
}
