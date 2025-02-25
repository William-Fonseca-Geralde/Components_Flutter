import 'package:components_flutter/src/views/components_pages/actions/common_buttons.dart';
import 'package:components_flutter/src/views/components_pages/actions/floating_action_buttons.dart';
import 'package:flutter/material.dart';

class ActionsPage extends StatelessWidget {
  const ActionsPage({super.key, required this.onButtonPressed});

  final Function(String) onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Wrap(
                runSpacing: 30,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 30,
                children: [
                  CommonButtons(onButtonPressed: onButtonPressed),
                  FloatingActionButtons(onButtonPressed: onButtonPressed),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
