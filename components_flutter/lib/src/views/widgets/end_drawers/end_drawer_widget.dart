import 'package:components_flutter/src/components_types/components_tips.dart';
import 'package:components_flutter/src/views/widgets/end_drawers/card_explicacao/card_explicacao.dart';
import 'package:components_flutter/src/views/widgets/end_drawers/dart_implementacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EndDrawerWidget extends ConsumerStatefulWidget {
  const EndDrawerWidget({super.key, required this.selectedComponent});

  final String selectedComponent;
  @override
  ConsumerState<EndDrawerWidget> createState() => _EndDrawerWidgetState();
}

class _EndDrawerWidgetState extends ConsumerState<EndDrawerWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  late Map<String, dynamic> component;
  late final Map<String, dynamic> components;

  @override
  void initState() {
    super.initState();
    final buttonsComponents = componentTips["Actions"]["CommonButtons"];
    final fabsComponents = componentTips["Actions"]["FloatingButtons"];

    components = {
      "Botões Comuns": buttonsComponents,
      "Botões de Ação Flutuante": fabsComponents,
    };

    _updateComponent();

    tabController = TabController(length: component.length, vsync: this);
    tabController.addListener(handleTabChange);
  }

  void _updateComponent() {
    component = (components[widget.selectedComponent] as Map<String, dynamic>);
  }

  @override
  void dispose() {
    tabController.removeListener(handleTabChange);
    tabController.dispose();
    super.dispose();
  }

  void handleTabChange() {
    setState(() {});
  }

  void nextTab() {
    if (tabController.index < tabController.length - 1) {
      tabController.animateTo(tabController.index + 1);
    }
  }

  void previousTab() {
    if (tabController.index > 0) {
      tabController.animateTo(tabController.index - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double drawerWidth = constraints.maxWidth * 0.75;
        if (constraints.maxWidth > 850) {
          drawerWidth = constraints.maxWidth * 0.65;
        }

        return Drawer(
          width: drawerWidth,
          child: Scaffold(
            body: ListView(
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
                      widget.selectedComponent != '' &&
                              components.containsKey(widget.selectedComponent)
                          ? widget.selectedComponent
                          : "Componente não selecionado",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
                Column(
                  children: [
                    TabBar(
                      controller: tabController,
                      isScrollable: true,
                      labelColor: Theme.of(context).colorScheme.primary,
                      unselectedLabelColor: Colors.grey,
                      tabs:
                          component.keys
                              .map((name) => Tab(text: name))
                              .toList(),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.74,
                      child: TabBarView(
                        controller: tabController,
                        children:
                            component.values.map((comp) {
                              return _buildComponentDetails(
                                context,
                                comp,
                                constraints,
                              );
                            }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            floatingActionButton:
                MediaQuery.sizeOf(context).width < 800
                    ? Stack(
                      children: [
                        if (tabController.index > 0)
                          Positioned(
                            left: 25,
                            bottom: 16,
                            child: FloatingActionButton(
                              heroTag: "previousBtn",
                              onPressed: previousTab,
                              child: Icon(Icons.arrow_back),
                            ),
                          ),

                        if (tabController.index < tabController.length - 1)
                          Positioned(
                            right: 25,
                            bottom: 16,
                            child: FloatingActionButton(
                              heroTag: "nextBtn",
                              onPressed: nextTab,
                              child: Icon(Icons.arrow_forward),
                            ),
                          ),
                      ],
                    )
                    : null,
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
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 25,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  spacing: 30,
                  children: [
                    CardExplicacao(context: context, componentData: componentData["explicacao"], constraints: constraints),
                    DartImplementacao(context: context, componentData: componentData, constraints: constraints),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
