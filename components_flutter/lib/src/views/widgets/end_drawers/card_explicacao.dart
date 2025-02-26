import 'package:flutter/material.dart';

class CardExplicacao extends StatefulWidget {
  const CardExplicacao({
    super.key,
    required this.context,
    required this.componentData,
    required this.constraints,
  });

  final BuildContext context;
  final Map componentData;
  final BoxConstraints constraints;

  @override
  State<CardExplicacao> createState() => _CardExplicacaoState();
}

class _CardExplicacaoState extends State<CardExplicacao> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        Card.outlined(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width:
                  widget.constraints.maxWidth < 800
                      ? widget.constraints.maxWidth * 1.75
                      : widget.constraints.maxWidth * 0.45,
              child: Card.outlined(
                color:
                    isExpanded
                        ? Theme.of(context).colorScheme.secondaryContainer
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
                                  ? Theme.of(
                                    context,
                                  ).colorScheme.secondaryContainer
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
                                    MainAxisAlignment.spaceBetween,
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
                                              ).colorScheme.onSecondaryContainer
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
                        color: Theme.of(context).colorScheme.surface,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.componentData['subtitle'] ??
                                  "Sem Informações",
                              style: Theme.of(context).textTheme.bodyLarge,
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
    );
  }
}
