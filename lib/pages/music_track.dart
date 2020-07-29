import 'package:flutter/material.dart';

class MusicTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Track'),
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
