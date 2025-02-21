import 'package:flutter/material.dart';

class DrawerNavigationWidget extends StatefulWidget {
  const DrawerNavigationWidget({
    super.key,
    required this.currentPageIdx,
    required this.onPageChanged,
  });

  final int currentPageIdx;
  final ValueChanged<int> onPageChanged;

  @override
  State<DrawerNavigationWidget> createState() => _DrawerNavigationWidgetState();
}

class _DrawerNavigationWidgetState extends State<DrawerNavigationWidget> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: NavigationDrawer(
        onDestinationSelected: widget.onPageChanged,
        selectedIndex: widget.currentPageIdx,
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
            child: Text("Cores", style: Theme.of(context).textTheme.titleSmall),
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
    );
  }
}
