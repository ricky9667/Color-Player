import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.pushNamed(context, '/color_panel');
              },
              icon: Icon(Icons.palette),
              label: Text('Color panel'),
            ),
            SizedBox(height: 10.0),
            RaisedButton.icon(
              onPressed: () {
                print('Music track clicked');
                Navigator.pushNamed(context, '/music_track');
              },
              icon: Icon(Icons.music_note),
              label: Text('Music track'),
            ),
          ],
        ),
      ),
    );
  }
}
