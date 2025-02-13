import 'package:flutter/material.dart';

import '../widgets/card_frame.dart';

class CardList extends StatelessWidget {
  CardList({super.key}); // Removed const

  final List<Map<String, String>>? cardList = [
    {
      'title': 'Card 1',
      'subtitle': 'This is the first card',
    },
    {
      'title': 'Card 2',
      'subtitle': 'This is the second card',
    },
    {
      'title': 'Card 3',
      'subtitle': 'This is the third card',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: cardList?.map((card) => Card(
            child: ListTile(
              leading: Icon(Icons.album),
              title: Text(card['title']!),
              subtitle: Text(card['subtitle']!),
              trailing: Icon(Icons.more_vert),
              onTap: () {
                debugPrint('${card['title']} tapped');
              },
            ),
          )).toList() ?? [],
        ),
      ),
    );
  }
}
