import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color_player/blocs/color_panel/color_panel_bloc.dart';

class ColorPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Panel'),
      ),
      body: BlocBuilder<ColorPanelBloc, ColorPanelState>(
          builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
          child: Card(
            color: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('Choose color',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 24.0),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 20.0,
                    children: state.colorList.map((color) => getColorSelection(color)).toList(),
                  ),
                  SizedBox(height: 32.0),
                  Text('Set duration',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

Widget getColorSelection(Color color) {
  return GestureDetector(
    child: Material(
      color: Colors.grey[300],
      child: CircleAvatar(
        backgroundColor: color,
        radius: 20.0,
      ),
    ),
  );
}
