import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/increment_counter.dart';
import '../models/integer_list_generator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required List<int> numbers,
  }) : _numbers = numbers;

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
          Consumer<Counter>(
            builder: (context, counter, child) {
              return Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },
          ),
          //ListView�� ���� ���� �Ҽ� �ִ� ������ �־�� ��
          //SizeBox�� height �Ӽ� �ο��ؼ� ��� ����
          //Expanded ������ ����ϸ� ���� ��ũ�� �̿��ؼ� ���� ���� ���� ��� ����
          ElevatedButton(
            onPressed: () {
              var integerListGenerator = context.read<IntegerListGenerator>();
              integerListGenerator.generateNumbers();
            },
            child: const Text('Generate New Numbers'),
          ),
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
