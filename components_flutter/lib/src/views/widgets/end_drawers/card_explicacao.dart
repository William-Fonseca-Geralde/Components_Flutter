import 'package:components_flutter/src/views/widgets/end_drawers/card_explicacao/colors_components.dart';
import 'package:components_flutter/src/views/widgets/end_drawers/card_explicacao/explicacao.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        Card.outlined(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Sobre o Componente",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Explicacao(
                  componentData:
                      widget.componentData['subtitle'] ?? "Sem Informação",
                  constraints: widget.constraints,
                ),
                ColorsComponents(
                  componentData:
                      widget.componentData["colors"] ?? "Sem Informação",
                  constraints: widget.constraints,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
