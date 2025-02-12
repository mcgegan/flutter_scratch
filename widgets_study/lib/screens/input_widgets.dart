import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InputWidgets extends StatelessWidget {
  const InputWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Input Widgets'),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
                hintText: 'Type something...',
              ),
              onChanged: (value) {
                debugPrint('Text field value: $value');
              },
            ),
            SizedBox(height: 8),
            Checkbox(
              value: false,
              onChanged: (bool? value) {
                debugPrint('Checkbox value: $value');
              },
            ),
            SizedBox(height: 8),
            Radio(
              value: 'option1',
              groupValue: 'option1',
              onChanged: (value) {
                debugPrint('Radio value: $value');
              },
            ),
            SizedBox(height: 8),
            Switch(
              value: false,
              onChanged: (bool value) {
                debugPrint('Switch value: $value');
              },
            ),
            SizedBox(height: 8),
            Slider(
              value: 0,
              onChanged: (value) {
                debugPrint('Slider value: $value');
              },
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: 'Option 1',
              items: <String>['Option 1', 'Option 2', 'Option 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                debugPrint('Dropdown value: $value');
              },
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (int index) {
                  debugPrint('CupertinoPicker selected index: $index');
                },
                children: List<Widget>.generate(10, (int index) {
                  return Center(
                    child: Text('Item $index'),
                  );
                }),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                );
                if (picked != null) {
                  debugPrint('Date picked: $picked');
                }
              },
              child: const Text('Show Date Picker'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  debugPrint('Time picked: $picked');
                }
              },
              child: const Text('Show Time Picker'),
            ),
          ],
        ),
      ),
    );
  }
}
