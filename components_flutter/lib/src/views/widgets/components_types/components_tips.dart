import 'package:flutter/material.dart';

final Map componentTips = {
  "ElevatedButton": {
    "subtitle": ' Os ElevatedButtons são essencialmente botões tonais preenchidos com uma sombra. Para evitar o deslocamento de sombras, use-os apenas quando for absolutamente necessário, como quando o botão exigir separação visual de um fundo padronizado.',
    "code": {
      "Normal": {
        "codigo": '''
  ElevatedButton(
    onPressed: () {
      // Algum código após o clique
    },
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
    onPressed: () {
      // Algum código após o clique
    },
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
    onPressed: () {
      // Algum código após o clique
    },
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
    onPressed: () {
      // Algum código após o clique
    },
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
  },
  "FilledTonalButton": {
    "subtitle": 'Os filleds tonal buttons são um meio termo alternativo entre FilledButtons e os OutlinedButtons. Eles são úteis em contextos onde um botão de prioridade mais baixa requer um pouco mais de ênfase do que um esboço daria, como “Próximo” em um fluxo de integração. Os botões tonais usam o mapeamento de cores secundárias.',
    "code": {
      "Normal": {
        "codigo": '''
  FilledButton.tonal(
    onPressed: () {
      // Algum código após o clique
    },
    child: Text("Filled"),
  ),''',
        "widget": () => FilledButton.tonal(
          onPressed: () {},
          child: Text("Filled"),
        ),
      },
      "Icon":{
        "codigo": '''
  FilledButton.tonalIcon(
    onPressed: () {
      // Algum código após o clique
    },
    label: Text("Ícone"),
    icon: Icon(Icons.add),
  ),''',
        "widget": () => FilledButton.tonalIcon(
          onPressed: () {},
          label: Text("Ícone"),
          icon: Icon(Icons.add),
        ),
      },
      "Desativado":{
        "codigo": '''
  FilledButton.tonal(
    onPressed: null,
    child: Text("Filled"),
  ),''',
        "widget": () => FilledButton.tonal(
          onPressed: null,
          child: Text("Filled"),
        ),
      }
    },
    "properties": {
      "autofocus": "True if this widget will be selected as the initial focus when no other node in its scope is currently focused.",
      "child": "Typically the button's label."
    },
  },
  "OutlinedButton": {
    "subtitle": 'Os OutlinedButtons são botões de ênfase média. Eles contêm ações que são importantes, mas não são a ação principal em um aplicativo, combinando bem com FilledButtons para indicar uma ação secundária alternativa.',
    "code": {
      "Normal": {
        "codigo": '''
  OutlinedButton(
    onPressed: () {
      // Algum código após o clique
    },
    child: Text("Filled"),
  ),''',
        "widget": () => OutlinedButton(
          onPressed: () {},
          child: Text("Filled"),
        ),
      },
      "Icon":{
        "codigo": '''
  OutlinedButton.icon(
    onPressed: () {
      // Algum código após o clique
    },
    label: Text("Ícone"),
    icon: Icon(Icons.add),
  ),''',
        "widget": () => OutlinedButton.icon(
          onPressed: () {},
          label: Text("Ícone"),
          icon: Icon(Icons.add),
        ),
      },
      "Desativado":{
        "codigo": '''
  OutlinedButton(
    onPressed: null,
    child: Text("Filled"),
  ),''',
        "widget": () => OutlinedButton(
          onPressed: null,
          child: Text("Filled"),
        ),
      }
    },
    "properties": {
      "autofocus": "True if this widget will be selected as the initial focus when no other node in its scope is currently focused.",
      "child": "Typically the button's label."
    },
  },
  "TextButton": {
    "subtitle": 'Os TextButtons são utilizados para as ações de prioridade mais baixa, especialmente quando apresentam múltiplas opções, podendo serem colocados em vários planos de fundo. Até que haja interação com o botão, seu contêiner não estará visível.',
    "code": {
      "Normal": {
        "codigo": '''
  TextButton(
    onPressed: () {
      // Algum código após o clique
    },
    child: Text("Filled"),
  ),''',
        "widget": () => TextButton(
          onPressed: () {},
          child: Text("Filled"),
        ),
      },
      "Icon":{
        "codigo": '''
  TextButton.icon(
    onPressed: () {
      // Algum código após o clique
    },
    label: Text("Ícone"),
    icon: Icon(Icons.add),
  ),''',
        "widget": () => TextButton.icon(
          onPressed: () {},
          label: Text("Ícone"),
          icon: Icon(Icons.add),
        ),
      },
      "Desativado":{
        "codigo": '''
  TextButton(
    onPressed: null,
    child: Text("Filled"),
  ),''',
        "widget": () => TextButton(
          onPressed: null,
          child: Text("Filled"),
        ),
      }
    },
    "properties": {
      "autofocus": "True if this widget will be selected as the initial focus when no other node in its scope is currently focused.",
      "child": "Typically the button's label."
    },
  },
};