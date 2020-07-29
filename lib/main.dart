import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Player',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Color Player'),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton.icon(
                onPressed: () {
                  print('Color panel clicked');
                },
                icon: Icon(Icons.palette),
                label: Text('Color panel'),
              ),
              SizedBox(height: 10.0),
              RaisedButton.icon(
                onPressed: () {
                  print('Music track clicked');
                },
                icon: Icon(Icons.music_note),
                label: Text('Music track'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}