import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Panel'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Card(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Choose color',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )
                ),
                SizedBox(height: 10.0),
                GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  crossAxisCount: 4,
                  children: <Widget>[

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorSelector extends StatefulWidget {
  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

