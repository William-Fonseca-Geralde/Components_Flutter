import 'package:flutter/material.dart';

final List<Widget> buttonTypes = [
  ElevatedButton(onPressed: () {}, child: Text("Elevated")),
  FilledButton(onPressed: () {}, child: Text("Filled")),
  FilledButton.tonal(onPressed: () {}, child: Text("Filled Tonal")),
  OutlinedButton(onPressed: () {}, child: Text("Outlined")),
  TextButton(onPressed: () {}, child: Text("Text")),
];

final List<Widget> iconButtonTypes = [
  ElevatedButton.icon(
    onPressed: () {},
    label: Text("Ícone"),
    icon: Icon(Icons.add),
  ),
  FilledButton.icon(
    onPressed: () {},
    label: Text("Ícone"),
    icon: Icon(Icons.add),
  ),
  FilledButton.tonalIcon(
    onPressed: () {},
    label: Text("Ícone"),
    icon: Icon(Icons.add),
  ),
  OutlinedButton.icon(
    onPressed: () {},
    label: Text("Ícone"),
    icon: Icon(Icons.add),
  ),
  TextButton.icon(
    onPressed: () {},
    label: Text("Ícone"),
    icon: Icon(Icons.add),
  ),
];

final List<Widget> disabledButtons = [
  ElevatedButton(onPressed: null, child: Text("Elevated")),
  FilledButton(onPressed: null, child: Text("Filled")),
  FilledButton.tonal(onPressed: null, child: Text("Filled Tonal")),
  OutlinedButton(onPressed: null, child: Text("Outlined")),
  TextButton(onPressed: null, child: Text("Text")),
];

final List<Widget> fabs = [
  FloatingActionButton.small(onPressed: () {}, child: Icon(Icons.add)),
  FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
  FloatingActionButton.extended(
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Text("Adicionar"),
  ),
  FloatingActionButton.large(onPressed: () {}, child: Icon(Icons.add)),
];
