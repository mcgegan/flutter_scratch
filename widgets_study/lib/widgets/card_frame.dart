import 'package:flutter/material.dart';

class CardFrame extends StatelessWidget {
  const CardFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.album),
        title: Text('Sample Card'),
        subtitle: Text('This is a sample card'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          debugPrint('Sample card tapped');
        },
      ),
    );
  }
}
