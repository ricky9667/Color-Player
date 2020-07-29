import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color_player/blocs/color_panel/color_panel_bloc.dart';
import 'package:flutter_color_player/pages/color_panel.dart';
import 'package:flutter_color_player/pages/home.dart';
import 'package:flutter_color_player/pages/music_track.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorPanelBloc>(
          create: (context) => ColorPanelBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Color Player',
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/blocs.color_panel': (context) => ColorPanel(),
          '/blocs.music_track': (context) => MusicTrack(),
        },
      ),
    );
  }
}