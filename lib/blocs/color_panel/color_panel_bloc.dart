import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'color_panel_event.dart';

part 'color_panel_state.dart';

class ColorPanelBloc extends Bloc<ColorPanelEvent, ColorPanelState> {
  ColorPanelBloc() : super(ColorPanelState.init());

  @override
  Stream<ColorPanelState> mapEventToState(
    ColorPanelEvent event,
  ) async* {
    if (event is ColorTappedEvent) {
      yield ColorPanelState(
          colorList: defaultColorList,
          colorIndex: event.colorIndex,
          newColor: defaultColorList[event.colorIndex]);
    }
    else if (event is ColorLongPressEvent) {
      List<Color> newColorList = defaultColorList;
      newColorList[event.colorIndex] = event.newColor;

      yield ColorPanelState(
          colorList: newColorList,
          colorIndex: event.colorIndex,
          newColor: event.newColor);
    }
  }
}
