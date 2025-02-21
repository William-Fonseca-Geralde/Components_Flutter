import 'package:components_flutter/src/views/widgets/components_types/buttons_types.dart';
import 'package:flutter/material.dart';

class ActionsPage extends StatelessWidget {
  const ActionsPage({super.key, required this.onButtonPressed});

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

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;

            return Center(
              child: Wrap(
                runSpacing: 45,
                spacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 30,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
            );
          },
        ),
      ),
    );
  }
}
