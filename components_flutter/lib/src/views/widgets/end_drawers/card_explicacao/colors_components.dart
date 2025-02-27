import 'package:components_flutter/src/components_types/components_tips.dart';
import 'package:components_flutter/src/views/colors_pages/color_box.dart';
import 'package:flutter/material.dart';

class ColorsComponents extends StatefulWidget {
  const ColorsComponents({
    super.key,
    required this.componentData,
    required this.constraints,
  });

  final Map componentData;
  final BoxConstraints constraints;

  @override
  State<ColorsComponents> createState() => _ColorsComponentsState();
}

class _ColorsComponentsState extends State<ColorsComponents> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    bool isLarge = MediaQuery.of(context).size.width > 720;

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
                            "Esquema de Cores",
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
              height: isExpanded ? (isLarge ? 260 : 430) : 0,
              child: Container(
                constraints: BoxConstraints.expand(),
                child: Card(
                  color: Theme.of(context).colorScheme.surface,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          alignment: WrapAlignment.center,
                          children: [
                            SizedBox(
                              width: isLarge ? 200 : 300,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      widget.componentData["imgs"][0] ??
                                          "Sem Informação",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: isLarge ? 230 : double.infinity,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: widget.componentData["types"].length,
                                itemBuilder: (context, index) {
                                  String key = widget
                                      .componentData["types"]
                                      .keys
                                      .elementAt(index);
                                  
                                  Color cor = getColorFromScheme(colorScheme, widget.componentData["types"][key][0]);
                                  Color onCor = getColorFromScheme(colorScheme, widget.componentData["types"][key][1]);

                                  return Column(
                                    spacing: 50,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ColorBox(
                                        label: "${index + 1} - $key",
                                        color: cor,
                                        onColor: onCor,
                                        height: 95,
                                        width: 235,
                                      ),
                                      
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
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
