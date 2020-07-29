part of 'color_panel_bloc.dart';

@immutable
class ColorPanelState {
  final List<Color> colorList;
  final int colorIndex;
  final Color newColor;

  const ColorPanelState({
    @required this.colorList,
    @required this.colorIndex,
    @required this.newColor,
  })  : assert(colorList != null),
        assert(colorIndex != null),
        assert(newColor != null);

  factory ColorPanelState.init() {
    return ColorPanelState(colorList: defaultColorList, colorIndex: 0, newColor: defaultColorList[0]);
  }
}

final List<Color> defaultColorList = [
  Colors.white,
  Colors.pink,
  Colors.red,
  Colors.orange,
  Colors.amber,
  Colors.yellow, // 6
  Colors.green,
  Colors.cyan,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
  Colors.brown,
];
