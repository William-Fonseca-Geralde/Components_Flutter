import 'package:flutter/material.dart';

final Map componentTips = {
  "ElevatedButton": {
    "subtitle": 'ElevatedButtons são botões de ênfase média, frequentemente usados ​​quando um botão requer separação visual de um fundo padronizado.',
    "code": {
      "Normal": {
        "codigo": '''
  ElevatedButton(
    onPressed: () {},
    child: Text("Elevated"),
  ),''',
        "widget": () => ElevatedButton(
          onPressed: () {},
          child: Text("Elevated"),
        ),
      },
      "Icon":{
        "codigo": '''
  ElevatedButton.icon(
    onPressed: () {},
    label: Text("Ícone"),
    icon: Icon(Icons.add),
  ),''',
        "widget": () => ElevatedButton.icon(
          onPressed: () {},
          label: Text("Ícone"),
          icon: Icon(Icons.add),
        ),
      },
      "Desativado":{
        "codigo": '''
  ElevatedButton(
    onPressed: null,
    child: Text("Elevated"),
  ),''',
        "widget": () => ElevatedButton(
          onPressed: null,
          child: Text("Elevated"),
        ),
      }
    },
    "properties": {
      "autofocus": "True if this widget will be selected as the initial focus when no other node in its scope is currently focused.",
      "child": "Typically the button's label."
    },
  }
};