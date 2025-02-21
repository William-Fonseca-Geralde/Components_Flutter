import 'package:components_flutter/src/views/widgets/components_types/components_tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EndDrawerWidget extends StatelessWidget {
  const EndDrawerWidget({super.key, required this.selectedComponent});

  final String selectedComponent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double drawerWidth = constraints.maxWidth * 0.65;
        if (constraints.maxWidth < 600) {
          drawerWidth = constraints.maxWidth * 0.75; // Mobile
        } else if (constraints.maxWidth > 1200) {
          drawerWidth = constraints.maxWidth * 0.55; // Desktop
        }

        return Drawer(
          width: drawerWidth,
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  spacing: 25,
                  children: [
                    Text(
                      selectedComponent != '' &&
                              componentTips.containsKey(selectedComponent)
                          ? componentTips[selectedComponent]['subtitle']
                          : "Sem Informações",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    selectedComponent != '' &&
                            componentTips.containsKey(selectedComponent)
                        ? Column(
                          spacing: 50,
                          children: [
                            Text(
                              "Como é Implementado",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            IntrinsicHeight(
                              child: Wrap(
                                runSpacing: 15,
                                alignment: WrapAlignment.center,
                                spacing: 15,
                                children: [
                                  for (var entry
                                      in componentTips[selectedComponent]["code"]
                                              ?.entries ??
                                          [])
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            constraints.maxWidth < 600
                                                ? 350
                                                : 450,
                                      ),
                                      child: Column(
                                        spacing: 15,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            entry.key,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Card.filled(
                                            child: Padding(
                                              padding: EdgeInsets.all(16),
                                              child: Column(
                                                spacing: 30,
                                                children: [
                                                  SizedBox(
                                                    width: 275,
                                                    child: Card.outlined(
                                                      borderOnForeground: true,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                          10,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            SelectableText(
                                                              entry
                                                                  .value["codigo"],
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'monospace',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  entry.value["widget"](),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        )
                        : Text("Sem código"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
