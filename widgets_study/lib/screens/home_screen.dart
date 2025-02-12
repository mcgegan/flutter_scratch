import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/increment_counter.dart';
import '../models/integer_list_generator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Consumer<Counter>(
            builder: (context, counter, child) {
              return Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              var integerListGenerator = context.read<IntegerListGenerator>();
              integerListGenerator.generateNumbers();
            },
            child: const Text('Generate New Numbers'),
          ),
          //ListView는 높이 제한 할수 있는 위젯에 넣어야 함
          //SizeBox에 height 속성 부여해서 사용 가능
          //Expanded 위젯을 사용하면 남은 스크린 이용해서 높이 제한 없이 사용 가능
          Expanded(
            child: Consumer<IntegerListGenerator>(
              builder: (context, integerListGenerator, child) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: integerListGenerator.numbers.length,
                  itemBuilder: (context, index) {
                    return Text(integerListGenerator.numbers[index].toString());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
