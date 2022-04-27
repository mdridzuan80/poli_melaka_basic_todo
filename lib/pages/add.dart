import 'package:flutter/material.dart';
import 'dart:math';

class Add extends StatefulWidget {
  final Function add_process;

  const Add({Key? key, required this.add_process}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final titleInput = TextEditingController();
  final Random random = Random();
  var text = '';

  String? get errorText {
    if (text.isEmpty) {
      return "Please insert title";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Add'),
      ),
      body: Container(
        color: Colors.amber.shade50,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                ),
                controller: titleInput,
                onChanged: (value) => setState(() {
                  text = value;
                }),
              ),
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: text.isNotEmpty
                  ? () {
                      final data = {
                        'id': random.nextInt(10000),
                        'title': titleInput.text
                      };
                      widget.add_process(data);
                      Navigator.of(context).pop();
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
