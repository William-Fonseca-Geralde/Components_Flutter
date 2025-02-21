import 'package:components_flutter/src/components_tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EndDrawerWidget extends StatelessWidget {
  const EndDrawerWidget({super.key, required this.selectedComponent});

  final String selectedComponent;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.sizeOf(context).width * 0.75,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Text(
                selectedComponent != '' &&
                        componentTips.containsKey(selectedComponent)
                    ? selectedComponent
                    : "Componente não selecionado",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                selectedComponent != '' &&
                        componentTips.containsKey(selectedComponent)
                    ? componentTips[selectedComponent]['subtitle']
                    : "Sem Informações",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            selectedComponent != '' &&
                    componentTips.containsKey(selectedComponent)
                ? Column(
                  spacing: 25,
                  children: [
                    Text(
                      "Como é Implementado",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    for (var entry
                        in componentTips[selectedComponent]["code"]?.entries ??
                            [])
                      Column(
                        spacing: 15,
                        children: [
                          Text(
                            entry.key,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              entry.value["widget"](),
                              SizedBox(
                                width: 250,
                                child: Card.outlined(
                                  borderOnForeground: true,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            SelectableText(
                                              entry.value["codigo"],
                                              style: TextStyle(
                                                fontFamily: 'monospace',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            IconButton.filledTonal(
                                              onPressed: () {
                                                Clipboard.setData(
                                                  ClipboardData(
                                                    text: entry.value["codigo"],
                                                  ),
                                                );
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(

                                                    content: Text(
                                                      "Código copiado!",
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: Icon(Icons.copy),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                )
                : Text("Sem código"),
          ],
        ),
      );
  }
}