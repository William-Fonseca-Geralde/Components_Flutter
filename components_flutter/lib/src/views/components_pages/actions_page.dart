import 'package:flutter/material.dart';

class ActionsPage extends StatelessWidget {
  const ActionsPage({super.key, required this.onButtonPressed});

  final Function(String) onButtonPressed;

  @override
  Widget build(BuildContext context) {

    final List<String> buttonNames = [
      "ElevatedButton",
      "FilledButton",
      "FilledTonalButton",
      "OutlinedButton",
      "TextButton",
    ]; 

    final List<Widget> buttonTypes = [
      ElevatedButton(onPressed: () {}, child: Text("Elevated")),
      FilledButton(onPressed: () {}, child: Text("Filled")),
      FilledButton.tonal(onPressed: () {}, child: Text("Filled Tonal")),
      OutlinedButton(onPressed: () {}, child: Text("Outlined")),
      TextButton(onPressed: () {}, child: Text("Text")),
    ];

    final List<Widget> iconButtonTypes = [
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
    ];

    final List<Widget> disabledButtons = [
      ElevatedButton(onPressed: null, child: Text("Elevated")),
      FilledButton(onPressed: null, child: Text("Filled")),
      FilledButton.tonal(onPressed: null, child: Text("Filled Tonal")),
      OutlinedButton(onPressed: null, child: Text("Outlined")),
      TextButton(onPressed: null, child: Text("Text")),
    ];

    final List<Widget> iconButtons = List.generate(
      buttonNames.length,
      (index) => IconButton.outlined(
        iconSize: 15,
        style: ButtonStyle(minimumSize: WidgetStatePropertyAll(Size(15, 15))),
        onPressed: () => onButtonPressed(buttonNames[index]),
        icon: Icon(Icons.question_mark),
      ),
    );

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
                        for (var buttonList in [
                          buttonTypes,
                          iconButtonTypes,
                          disabledButtons,
                          iconButtons,
                        ])
                          IntrinsicWidth(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children:
                                  buttonList
                                      .map(
                                        (e) => Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: e,
                                        ),
                                      )
                                      .toList(),
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
