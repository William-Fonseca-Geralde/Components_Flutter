import 'package:components_flutter/src/views/widgets/components_types/components_tips.dart';
import 'package:flutter/material.dart';

class EndDrawerWidget extends StatelessWidget {
  const EndDrawerWidget({super.key, required this.selectedComponent});

  final String selectedComponent;

  @override
  Widget build(BuildContext context) {
    final buttonsComponents = componentTips["Actions"]["CommonButtons"];
    final fabsComponents = componentTips["Actions"]["FloatingButtons"];

    final Map components = {
      "Botões Comuns": buttonsComponents,
      "Botões de Ação Flutuante": fabsComponents,
    };

    final component = (components[selectedComponent] as Map<String, dynamic>);

    return LayoutBuilder(
      builder: (context, constraints) {
        double drawerWidth = constraints.maxWidth * 0.65;
        if (constraints.maxWidth < 600) {
          drawerWidth = constraints.maxWidth * 0.75;
        } else if (constraints.maxWidth > 1200) {
          drawerWidth = constraints.maxWidth * 0.55;
        }

        return Drawer(
          width: drawerWidth,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                width: double.infinity,
                height: 125,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Text(
                    selectedComponent != '' &&
                            components.containsKey(selectedComponent)
                        ? selectedComponent
                        : "Componente não selecionado",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
              DefaultTabController(
                length: component.length,
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      labelColor: Theme.of(context).colorScheme.primary,
                      unselectedLabelColor: Colors.grey,
                      tabs: component.keys.map((name) => Tab(text: name)).toList(),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.74,
                      child: TabBarView(
                        children:
                            component.values
                                .map((comp) {
                                  return _buildComponentDetails(
                                    context,
                                    comp,
                                    constraints,
                                  );
                                })
                                .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildComponentDetails(
    BuildContext context,
    Map componentData,
    BoxConstraints constraints,
  ) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 25,
          children: [
            Text(
              componentData['subtitle'] ?? "Sem Informações",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            selectedComponent != ''
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
                              in componentData["code"]?.entries ?? [])
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    constraints.maxWidth < 600 ? 350 : 450,
                              ),
                              child: IntrinsicHeight(
                                child: Column(
                                  spacing: 10,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      entry.key,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Expanded(
                                      child: Card.filled(
                                        child: SizedBox(
                                          width: 300,
                                          height: 275,
                                          child: Padding(
                                            padding: EdgeInsets.all(16),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.min,
                                              spacing: 30,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Card.outlined(
                                                        borderOnForeground:
                                                            true,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                10,
                                                              ),
                                                          child: SelectableText(
                                                            entry
                                                                .value["codigo"],
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'monospace',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          entry
                                                              .value["widget"](),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                  ],
                                ),
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
    );
  }
}
