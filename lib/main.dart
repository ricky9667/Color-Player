import 'package:flutter/material.dart';
import 'package:flutter_color_player/pages/color_panel.dart';
import 'package:flutter_color_player/pages/home.dart';
import 'package:flutter_color_player/pages/music_track.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Player',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/color_panel': (context) => ColorPanel(),
        '/music_track': (context) => MusicTrack(),
      },
    );
  }
}