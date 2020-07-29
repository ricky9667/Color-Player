part of 'color_panel_bloc.dart';

@immutable
abstract class ColorPanelEvent {}

class ColorTappedEvent extends ColorPanelEvent {
  final int colorIndex;

  ColorTappedEvent({@required this.colorIndex}) : assert(colorIndex != null);
}

class ColorLongPressEvent extends ColorPanelEvent {
  final int colorIndex;
  final Color newColor;

  ColorLongPressEvent({@required this.colorIndex, @required this.newColor})
      : assert(colorIndex != null),
        assert(newColor != null);
}
