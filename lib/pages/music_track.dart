import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color_player/blocs/music_track/music_track_bloc.dart';

class MusicTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Track'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton.icon(
            onPressed: () {
              playTrack();
            },
            icon: Icon(Icons.play_arrow),
            label: Text('Play Track'),
          ),
        ),
      )
    );
  }

  void playTrack() {
    final audioPlayer = AssetsAudioPlayer();

    try {
      Audio file = Audio.file('/storage/emulated/0/Music/Climb.mp3');
      audioPlayer.open(file);
    }
    catch (e){
      print('ERROR READING AUDIO FILE');
      print(e.toString());
    }
  }
}

/*
BlocBuilder<MusicTrackBloc, MusicTrackState>(
        builder: (context, state) {
          return Container(
            child: RaisedButton.icon(
              onPressed: () {
                playTrack();
              },
              icon: Icon(Icons.play_arrow),
              label: Text('Play Track'),
            ),
          );
        },
      ),
 */