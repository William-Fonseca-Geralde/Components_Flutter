import 'package:flutter/material.dart';

class Explicacao extends StatefulWidget {
  const Explicacao({
    super.key,
    required this.componentData,
    required this.constraints,
  });

  final String componentData;
  final BoxConstraints constraints;

  @override
  State<Explicacao> createState() => _ExplicacaoState();
}

class _ExplicacaoState extends State<Explicacao> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                          ? Theme.of(context).colorScheme.secondaryContainer
                          : Colors.transparent,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            isExpanded ? Icons.expand_less : Icons.expand_more,
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
                      widget.componentData,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}