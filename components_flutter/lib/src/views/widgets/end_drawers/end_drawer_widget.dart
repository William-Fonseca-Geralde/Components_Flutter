import 'package:components_flutter/src/providers/expand_provider.dart';
import 'package:components_flutter/src/views/widgets/components_types/components_tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EndDrawerWidget extends ConsumerStatefulWidget {
  const EndDrawerWidget({super.key, required this.selectedComponent});

  final String selectedComponent;

  @override
  ConsumerState<EndDrawerWidget> createState() => _EndDrawerWidgetState();
}

class _EndDrawerWidgetState extends ConsumerState<EndDrawerWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final buttonsComponents = componentTips["Actions"]["CommonButtons"];
    final fabsComponents = componentTips["Actions"]["FloatingButtons"];

    final Map components = {
      "Botões Comuns": buttonsComponents,
      "Botões de Ação Flutuante": fabsComponents,
    };

    final component =
        (components[widget.selectedComponent] as Map<String, dynamic>);

    return LayoutBuilder(
      builder: (context, constraints) {
        double drawerWidth = constraints.maxWidth * 0.75;
        if (constraints.maxWidth > 850) {
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
                    widget.selectedComponent != '' &&
                            components.containsKey(widget.selectedComponent)
                        ? widget.selectedComponent
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
                      tabs:
                          component.keys
                              .map((name) => Tab(text: name))
                              .toList(),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.74,
                      child: TabBarView(
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
    final expandedItems = ref.watch(expandedItemsProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 25,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  runSpacing: 45,
                  alignment: WrapAlignment.center,
                  spacing: 45,
                  children: [
                    Column(
                      spacing: 15,
                      children: [
                        Card.outlined(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              width:
                                  constraints.maxWidth < 700
                                      ? constraints.maxWidth * 1.75
                                      : constraints.maxWidth * 0.45,
                              child: Card.outlined(
                                color:
                                    isExpanded
                                        ? Theme.of(
                                          context,
                                        ).colorScheme.secondaryContainer
                                        : Colors.transparent,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isExpanded = !isExpanded;
                                        });
                                      },
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                              isExpanded
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .secondaryContainer
                                                  : Colors.transparent,
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(12),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Explicação",
                                                    style: Theme.of(
                                                      context,
                                                    ).textTheme.titleMedium?.copyWith(
                                                      color:
                                                          isExpanded
                                                              ? Theme.of(
                                                                    context,
                                                                  )
                                                                  .colorScheme
                                                                  .onSecondaryContainer
                                                              : null,
                                                    ),
                                                  ),
                                                  Icon(
                                                    isExpanded
                                                        ? Icons.expand_less
                                                        : Icons.expand_more,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 250),
                                      height: isExpanded ? 200 : 0,
                                      child: Card(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.surface,
                                        elevation: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8,
                                            horizontal: 12,
                                          ),
                                          child: SingleChildScrollView(
                                            child: Text(
                                              componentData['subtitle'] ??
                                                  "Sem Informações",
                                              style:
                                                  Theme.of(
                                                    context,
                                                  ).textTheme.bodyLarge,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Card.outlined(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  child: Text(
                                    "Como é Implementado",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                for (var entry
                                    in componentData["code"]?.entries ?? [])
                                  SizedBox(
                                    width:
                                        constraints.maxWidth < 700
                                            ? constraints.maxWidth * 1.75
                                            : constraints.maxWidth * 0.45,
                                    child: Card.outlined(
                                      color:
                                          ref.watch(expandedItemsProvider)[entry
                                                      .key] ??
                                                  false
                                              ? Theme.of(
                                                context,
                                              ).colorScheme.secondaryContainer
                                              : Theme.of(
                                                context,
                                              ).colorScheme.surface,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              ref
                                                  .read(
                                                    expandedItemsProvider
                                                        .notifier,
                                                  )
                                                  .state = {
                                                ...expandedItems,
                                                entry.key:
                                                    !(expandedItems[entry
                                                            .key] ??
                                                        false),
                                              };
                                            },
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    ref.watch(
                                                              expandedItemsProvider,
                                                            )[entry.key] ??
                                                            false
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .secondaryContainer
                                                        : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                      top: Radius.circular(12),
                                                    ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      entry.key,
                                                      style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .titleMedium,
                                                    ),
                                                    Icon(
                                                      expandedItems[entry
                                                                  .key] ??
                                                              false
                                                          ? Icons.expand_less
                                                          : Icons.expand_more,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration: Duration(
                                              milliseconds: 250,
                                            ),
                                            height:
                                                expandedItems[entry.key] ??
                                                        false
                                                    ? 300
                                                    : 0,
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  16,
                                                ),
                                                child: Card.filled(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
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
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            entry
                                                                .value["widget"](),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
