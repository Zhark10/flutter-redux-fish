import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _onchangeThemeColor,
    },
  );
}

List<Color> _colors = <Color>[
  Color.fromRGBO(97, 48, 48, 1),
  Color.fromRGBO(34, 66, 22, 1),
  Color.fromRGBO(74, 58, 28, 1),
  Color.fromRGBO(66, 28, 74, 1),
];

GlobalState _onchangeThemeColor(GlobalState state, Action action) {
  final Color next =
      _colors[((_colors.indexOf(state.themeColor) + 1) % _colors.length)];
  return state.clone()..themeColor = next;
}
