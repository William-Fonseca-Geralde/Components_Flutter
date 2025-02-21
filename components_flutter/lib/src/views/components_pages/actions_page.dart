import 'package:flutter/material.dart';

class ActionsPage extends StatelessWidget {
  const ActionsPage({super.key, required this.onButtonPressed});

  final Function(String) onButtonPressed;

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Botões Comuns",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Card.outlined(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      spacing: 10,
                      children: [
                        IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: 25,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Elevated"),
                              ),
                              FilledButton(
                                onPressed: () {},
                                child: Text("Filled"),
                              ),
                              FilledButton.tonal(
                                onPressed: () {},
                                child: Text("Filled Tonal"),
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                child: Text("Outlined"),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("Text"),
                              ),
                            ],
                          ),
                        ),
                        IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: 25,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                label: Text("Ícone"),
                                icon: Icon(Icons.add),
                              ),
                              FilledButton.icon(
                                onPressed: () {},
                                label: Text("Ícone"),
                                icon: Icon(Icons.add),
                              ),
                              FilledButton.tonalIcon(
                                onPressed: () {},
                                label: Text("Ícone"),
                                icon: Icon(Icons.add),
                              ),
                              OutlinedButton.icon(
                                onPressed: () {},
                                label: Text("Ícone"),
                                icon: Icon(Icons.add),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                label: Text("Ícone"),
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                        IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: 25,
                            children: [
                              ElevatedButton(
                                onPressed: null,
                                child: Text("Elevated"),
                              ),
                              FilledButton(
                                onPressed: null,
                                child: Text("Filled"),
                              ),
                              FilledButton.tonal(
                                onPressed: null,
                                child: Text("Filled Tonal"),
                              ),
                              OutlinedButton(
                                onPressed: null,
                                child: Text("Outlined"),
                              ),
                              TextButton(
                                onPressed: null,
                                child: Text("Text"),
                              ),
                            ],
                          ),
                        ),
                        IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: 30,
                            children: [
                              IconButton.outlined(
                                iconSize: 10,
                                style: ButtonStyle(
                                  minimumSize: WidgetStatePropertyAll(Size(10, 10))
                                ),
                                onPressed: () {
                                  onButtonPressed("ElevatedButton");
                                },
                                icon: Icon(Icons.question_mark),
                              ),
                              IconButton.outlined(
                                iconSize: 10,
                                style: ButtonStyle(
                                  minimumSize: WidgetStatePropertyAll(Size(10, 10))
                                ),
                                onPressed: () {},
                                icon: Icon(Icons.question_mark),
                              ),
                              IconButton.outlined(
                                iconSize: 10,
                                style: ButtonStyle(
                                  minimumSize: WidgetStatePropertyAll(Size(10, 10))
                                ),
                                onPressed: () {},
                                icon: Icon(Icons.question_mark),
                              ),
                              IconButton.outlined(
                                iconSize: 10,
                                style: ButtonStyle(
                                  minimumSize: WidgetStatePropertyAll(Size(10, 10))
                                ),
                                onPressed: () {},
                                icon: Icon(Icons.question_mark),
                              ),
                              IconButton.outlined(
                                iconSize: 10,
                                style: ButtonStyle(
                                  minimumSize: WidgetStatePropertyAll(Size(10, 10))
                                ),
                                onPressed: () {},
                                icon: Icon(Icons.question_mark),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
