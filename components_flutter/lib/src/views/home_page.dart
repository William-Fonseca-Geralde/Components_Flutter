import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:components_flutter/src/components_tips.dart';
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
      endDrawer: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.75,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Text(
                selectedComponent != '' &&
                        componentTips.containsKey(selectedComponent)
                    ? selectedComponent
                    : "Componente não selecionado",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                selectedComponent != '' &&
                        componentTips.containsKey(selectedComponent)
                    ? componentTips[selectedComponent]['subtitle']
                    : "Sem Informações",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            selectedComponent != '' &&
                    componentTips.containsKey(selectedComponent)
                ? Column(
                  spacing: 25,
                  children: [
                    Text(
                      "Como é Implementado",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    for (var entry
                        in componentTips[selectedComponent]["code"]?.entries ??
                            [])
                      Column(
                        spacing: 15,
                        children: [
                          Text(
                            entry.key,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              entry.value["widget"](),
                              SizedBox(
                                width: 250,
                                child: Card.outlined(
                                  borderOnForeground: true,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            SelectableText(
                                              entry.value["codigo"],
                                              style: TextStyle(
                                                fontFamily: 'monospace',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            IconButton.filledTonal(
                                              onPressed: () {
                                                Clipboard.setData(
                                                  ClipboardData(
                                                    text: entry.value["codigo"],
                                                  ),
                                                );
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(

                                                    content: Text(
                                                      "Código copiado!",
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: Icon(Icons.copy),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                )
                : Text("Sem código"),
          ],
        ),
      ),
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
      drawer: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.4,
        child: NavigationDrawer(
          onDestinationSelected: (value) {
            setState(() {
              currentPageIdx = value;
            });
          },
          selectedIndex: currentPageIdx,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
              child: Text(
                "Componentes",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.ads_click_outlined),
              label: Text('Ações'),
              selectedIcon: Icon(Icons.ads_click),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.chat_outlined),
              label: Text("Comunicação"),
              selectedIcon: Icon(Icons.chat),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.navigation_outlined),
              label: Text("Navegação"),
              selectedIcon: Icon(Icons.navigation),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.radio_button_off),
              label: Text("Seleção"),
              selectedIcon: Icon(Icons.radio_button_checked),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.text_fields_outlined),
              label: Text("Entradas de Texto"),
              selectedIcon: Icon(Icons.text_fields),
            ),
            const Divider(indent: 18, endIndent: 18),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
              child: Text(
                "Cores",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.light_mode_outlined),
              label: Text('Claro'),
              selectedIcon: Icon(Icons.light_mode),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.dark_mode_outlined),
              label: Text("Escuro"),
              selectedIcon: Icon(Icons.dark_mode),
            ),
          ],
        ),
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
