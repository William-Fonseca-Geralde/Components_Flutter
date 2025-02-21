import 'package:flutter/material.dart';

final Map componentTips = {
  "ElevatedButton": {
    "subtitle": ' Os ElevatedButtons são essencialmente botões tonais preenchidos com uma sombra. Para evitar o deslocamento de sombras, use-os apenas quando for absolutamente necessário, como quando o botão exigir separação visual de um fundo padronizado.',
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
  },
  "FilledButton": {
    "subtitle": 'Os FilledButtons têm o maior impacto visual depois do FAB e devem ser usados ​​para ações finais importantes que completam um fluxo, como Salvar, Ingressar agora ou Confirmar.',
    "code": {
      "Normal": {
        "codigo": '''
  FilledButton(
    onPressed: () {},
    child: Text("Filled"),
  ),''',
        "widget": () => FilledButton(
          onPressed: () {},
          child: Text("Filled"),
        ),
      },
      "Icon":{
        "codigo": '''
  FilledButton.icon(
    onPressed: () {},
    label: Text("Ícone"),
    icon: Icon(Icons.add),
  ),''',
        "widget": () => FilledButton.icon(
          onPressed: () {},
          label: Text("Ícone"),
          icon: Icon(Icons.add),
        ),
      },
      "Desativado":{
        "codigo": '''
  FilledButton(
    onPressed: null,
    child: Text("Filled"),
  ),''',
        "widget": () => FilledButton(
          onPressed: null,
          child: Text("Filled"),
        ),
      }
    },
    "properties": {
      "autofocus": "True if this widget will be selected as the initial focus when no other node in its scope is currently focused.",
      "child": "Typically the button's label."
    },
  }
};