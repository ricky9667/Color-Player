import 'package:flutter/material.dart';

class ColorPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Panel'),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back'),
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
