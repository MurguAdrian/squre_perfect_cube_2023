import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String rezultat1 = '';
  String rezultat2 = '';
  String rezultat3 = '';
  String rezultat = '';
  int input = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Square / Cube',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const Text(
            'Verifica un numar intreg pentru a vedea daca este Patrat Perfect sau Cub Perfect',
            style: TextStyle(fontSize: 15),
          ),
          TextField(
            controller: _controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(
                    () {
                      _controller.clear();
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            int input = int.parse(_controller.text);
            int x = sqrt(input).toInt();
            int y = pow(input, 1 / 3).toInt();
            if (x * x == input) {
              rezultat1 = 'Este patrat perfect , dar nu este Cub Perfect';
            } else {

              rezultat1 = 'Nu este patrat perfect';
            }

            if (y * y * y == input) {

              rezultat2 = 'Este Cub Perfect, dar nu este Patrat Perfect';
            } else {

              rezultat2 = 'Nu este Cub Perfect';
            }
            if (y * y * y == input && x * x == input) {
              rezultat3 = 'Este si cub si Patrat Perfect';
            } else {
              rezultat3 = 'Nu este nici cub si nici patrat perfect';
            }
            rezultat = _controller.text;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        Text(
                          rezultat,
                          style: const TextStyle(fontSize: 32),
                        ),Text(
                          rezultat1,
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(
                          rezultat2,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          rezultat3,
                          style: const TextStyle(fontSize: 15),
                        ),
                        ElevatedButton(
                          child: const Text('ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
