import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorBox extends StatefulWidget {
  const ColorBox({
    super.key,
    required this.label,
    required this.color,
    required this.onColor,
    required this.height,
    required this.width,
  });

  final String label;
  final Color color, onColor;
  final double height, width;

  @override
  State<ColorBox> createState() => _ColorBoxState();
}

class _ColorBoxState extends State<ColorBox> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final fonts = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (event) {
        if (mounted) setState(() => hovered = true);
      },
      onExit: (event) {
        if (mounted) setState(() => hovered = false);
      },
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Card(
          color: widget.color,
          elevation: 0,
          margin: EdgeInsets.zero,
          child: DefaultTextStyle(
            style: fonts.bodyLarge!.copyWith(
              color: widget.onColor,
              fontWeight: FontWeight.bold,
            ),
            child: Stack(
              children: [
                Positioned(top: 10, left: 10, child: Text(widget.label)),
                if (hovered)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      color: widget.onColor,
                      tooltip: "Copiar cor hexadecimal",
                      onPressed: () async {
                        final mensagem = ScaffoldMessenger.of(context);

                        final hex =
                            '#${_colorChannelToHex(widget.color.r)}'
                            '${_colorChannelToHex(widget.color.g)}'
                            '${_colorChannelToHex(widget.color.b)}';

                        final data = ClipboardData(text: hex);
                        await Clipboard.setData(data);

                        mensagem.hideCurrentSnackBar();
                        mensagem.showSnackBar(
                          SnackBar(
                            content: Text("$hex Copiado!"),
                            behavior: SnackBarBehavior.floating,
                            width: 400,
                            action: SnackBarAction(
                              label: "Fechar",
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.copy),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _colorChannelToHex(double value) {
  final intVal = (value * 255).round();
  return intVal.toRadixString(16).padLeft(2, '0');
}

Color getColorFromScheme(ColorScheme colorScheme, String colorName) {
  Map<String, Color> colorMapping = {
    "primary": colorScheme.primary,
    "onPrimary": colorScheme.onPrimary,
    "primaryContainer": colorScheme.primaryContainer,
    "onPrimaryContainer": colorScheme.onPrimaryContainer,
    "inversePrimary": colorScheme.inversePrimary,
    "secondary": colorScheme.secondary,
    "onSecondary": colorScheme.onSecondary,
    "secondaryContainer": colorScheme.secondaryContainer,
    "onSecondaryContainer": colorScheme.onSecondaryContainer,
    "tertiary": colorScheme.tertiary,
    "onTertiary": colorScheme.onTertiary,
    "tertiaryContainer": colorScheme.tertiaryContainer,
    "onTertiaryContainer": colorScheme.onTertiaryContainer,
    "surface": colorScheme.surface,
    "onSurface": colorScheme.onSurface,
    "surfaceDim": colorScheme.surfaceDim,
    "surfaceBright": colorScheme.surfaceBright,
    "onSurfaceVariant": colorScheme.onSurfaceVariant,
    "surfaceContainerLowest": colorScheme.surfaceContainerLowest,
    "surfaceContainerLow": colorScheme.surfaceContainerLow,
    "surfaceContainer": colorScheme.surfaceContainer,
    "surfaceContainerHigh": colorScheme.surfaceContainerHigh,
    "surfaceContainerHighest": colorScheme.surfaceContainerHighest,
    "inverseSurface": colorScheme.inverseSurface,
    "onInverseSurface": colorScheme.onInverseSurface,
    "error": colorScheme.error,
    "onError": colorScheme.onError,
    "errorContainer": colorScheme.errorContainer,
    "onErrorContainer": colorScheme.onErrorContainer,
    "outline": colorScheme.outline,
    "outlineVarian": colorScheme.outlineVariant,
    "shadow": colorScheme.shadow,
    "scrim": colorScheme.scrim,
  };

  return colorMapping[colorName] ??
      Colors.black; // Retorna preto se não encontrar
}
