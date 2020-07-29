part of 'color_panel_bloc.dart';

@immutable
abstract class ColorPanelEvent {}

class ColorTappedEvent extends ColorPanelEvent {
  final int colorIndex;

  ColorTappedEvent({
    @required this.colorIndex,
  }) : assert(colorIndex != null);
}

// class ColorLongPressEvent extends ColorPanelEvent {}
