import 'package:components_flutter/src/views/widgets/drawer_navigation_widget.dart';
import 'package:components_flutter/src/views/widgets/end_drawers/end_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:components_flutter/src/providers/theme_notifier.dart';
import 'package:components_flutter/src/views/components_pages/actions_page.dart';
import 'package:components_flutter/src/views/components_pages/communication_page.dart';
import 'package:components_flutter/src/views/components_pages/navigation_page.dart';
import 'package:components_flutter/src/views/components_pages/selection_page.dart';
import 'package:components_flutter/src/views/components_pages/text_inputs_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey _menuKey = GlobalKey();
  int currentPageIdx = 0;
  String selectedComponent = '';
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer(String component) {
    setState(() {
      selectedComponent = component;
    });
    scaffoldKey.currentState?.openEndDrawer();
  }

  Map<String, Color> colorsOptions = {
    "Padrão": Color(0xff6750a4),
    "Azul": Colors.blue,
    "Vermelho": Colors.red,
    "Verde": Colors.green,
    "Roxo": Colors.purple,
    "Laranja": Colors.orange,
    "Amarelo": Colors.yellow,
  };

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    final colorNotifier = ref.read(colorProvider.notifier);
    final selectedColor = ref.watch(colorProvider);

    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerNavigationWidget(
        currentPageIdx: currentPageIdx,
        onPageChanged: (value) {
          setState(() {
            currentPageIdx = value;
          });
        },
      ),
      endDrawer: EndDrawerWidget(selectedComponent: selectedComponent),
      appBar: AppBar(
        title: const Text("Material App 3"),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        actionsPadding: EdgeInsets.symmetric(horizontal: 40),
        actions: [
          MenuAnchor(
            key: _menuKey,
            builder: (context, controller, child) {
              return IconButton.filled(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: Icon(
                  Icons.colorize,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              );
            },
            menuChildren: [
              for (var entry in colorsOptions.entries)
                MenuItemButton(
                  onPressed:
                      entry.value == selectedColor
                          ? null
                          : () => colorNotifier.state = entry.value,
                  leadingIcon: Icon(Icons.colorize, color: entry.value),
                  child: Text(
                    entry.key,
                    style: TextStyle(
                      fontWeight:
                          entry.value != selectedColor
                              ? FontWeight.w600
                              : FontWeight.normal,
                    ),
                  ),
                ),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          IconButton(
            onPressed: () {
              themeNotifier.state = !themeMode;
            },
            icon: Icon(themeMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: currentPageIdx,
              children: [
                ActionsPage(onButtonPressed: _openDrawer),
                CommunicationPage(),
                NavigationPage(),
                SelectionPage(),
                TextInputsPage(),
                Container(
                  color: Colors.purple,
                  child: const Center(child: Text("Pagina 6 - Light Mode")),
                ),
                Container(
                  color: Colors.brown,
                  child: const Center(child: Text("Pagina 7 - Dark Mode")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
