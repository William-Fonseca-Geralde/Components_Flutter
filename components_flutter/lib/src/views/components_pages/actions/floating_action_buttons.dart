import 'package:components_flutter/src/views/components_pages/actions/buttons_types.dart';
import 'package:flutter/material.dart';

class FloatingActionButtons extends StatefulWidget {
  const FloatingActionButtons({super.key, required this.onButtonPressed});

  final Function(String) onButtonPressed;

  @override
  State<FloatingActionButtons> createState() => _FloatingActionButtonsState();
}

class _FloatingActionButtonsState extends State<FloatingActionButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 25,
          children: [
            Text(
              "Botões de Ação Flutuante",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            IconButton.outlined(
              iconSize: 15,
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(15, 15)),
              ),
              onPressed: () => widget.onButtonPressed("Botões de Ação Flutuante"),
              icon: Icon(Icons.question_mark),
            ),
          ],
        ),
        IntrinsicWidth(
          child: Card.outlined(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                spacing: 10,
                children: [
                  for (var fab in fabs) ...[
                    IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: fab,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
