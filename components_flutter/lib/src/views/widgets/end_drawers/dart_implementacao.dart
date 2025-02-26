import 'package:components_flutter/src/providers/expand_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DartImplementacao extends ConsumerStatefulWidget {
  const DartImplementacao({
    super.key,
    required this.context,
    required this.componentData,
    required this.constraints,
  });

  final BuildContext context;
  final Map componentData;
  final BoxConstraints constraints;

  @override
  ConsumerState<DartImplementacao> createState() => _DartImplementacaoState();
}

class _DartImplementacaoState extends ConsumerState<DartImplementacao> {

  @override
  Widget build(BuildContext context) {
    final expandedItems = ref.watch(expandedItemsProvider);

    return Column(
      children: [
        Card.outlined(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Como é Implementado",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                for (var entry in widget.componentData["code"]?.entries ?? [])
                  SizedBox(
                    width:
                        widget.constraints.maxWidth < 800
                            ? widget.constraints.maxWidth * 1.75
                            : widget.constraints.maxWidth * 0.45,
                    child: Card.outlined(
                      color:
                          ref.watch(expandedItemsProvider)[entry.key] ?? false
                              ? Theme.of(context).colorScheme.secondaryContainer
                              : Theme.of(context).colorScheme.surface,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              ref.read(expandedItemsProvider.notifier).state = {
                                ...expandedItems,
                                entry.key: !(expandedItems[entry.key] ?? false),
                              };
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    ref.watch(expandedItemsProvider)[entry
                                                .key] ??
                                            false
                                        ? Theme.of(
                                          context,
                                        ).colorScheme.secondaryContainer
                                        : Colors.transparent,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      entry.key,
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                    ),
                                    Icon(
                                      expandedItems[entry.key] ?? false
                                          ? Icons.expand_less
                                          : Icons.expand_more,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 250),
                            height: expandedItems[entry.key] ?? false ? 300 : 0,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Card.filled(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 30,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Card.outlined(
                                                borderOnForeground: true,
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: SelectableText(
                                                    entry.value["codigo"],
                                                    style: TextStyle(
                                                      fontFamily: 'monospace',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [entry.value["widget"]()],
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
    );
  }
}
