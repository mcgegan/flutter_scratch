import 'package:flutter/material.dart';
import 'dart:math';

class ColorBoxList extends StatelessWidget {
  const ColorBoxList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Settings Screen'),
          SizedBox(height: 8),
          ColorBoxListRow(),
          SizedBox(height: 8),
          ColorBoxListColumn(),
        ],
      ),
    );
  }
}

class ColorBoxListRow extends StatelessWidget {
  const ColorBoxListRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(100, (index) {
          return Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0),
              border: Border.all(color: Colors.black),
            ),
          );
        }),
      ),
    );
  }
}

class ColorBoxListColumn extends StatelessWidget {
  const ColorBoxListColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 400,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0),
              border: Border.all(color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}
