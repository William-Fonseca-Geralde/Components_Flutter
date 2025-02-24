import 'package:components_flutter/src/views/components_pages/actions/buttons_types.dart';
import 'package:flutter/material.dart';

class CommonButtons extends StatelessWidget {
  const CommonButtons({super.key, required this.onButtonPressed});

  final Function(String) onButtonPressed;

  @override
  Widget build(BuildContext context) {
    final List<Widget> iconButtons = List.generate(
      buttonNames.length,
      (index) => IconButton.outlined(
        iconSize: 15,
        style: ButtonStyle(minimumSize: WidgetStatePropertyAll(Size(15, 15))),
        onPressed: () => onButtonPressed(buttonNames[index]),
        icon: Icon(Icons.question_mark),
      ),
    );

    return Column(
      spacing: 10,
      children: [
        Text("Botões Comuns", style: Theme.of(context).textTheme.titleLarge),
        IntrinsicWidth(
          child: Card.outlined(
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
                                    padding: EdgeInsets.symmetric(vertical: 10),
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
        ),
      ],
    );
  }
}
