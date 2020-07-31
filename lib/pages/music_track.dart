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
      body: BlocBuilder<MusicTrackBloc, MusicTrackState>(
        builder: (context, state) {
          MusicTrackBloc musicTrackBloc = context.bloc<MusicTrackBloc>();
          if(musicTrackBloc.trackPaths.isEmpty) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.error),
                  Text(' No tracks found'),
                ],
              ),
            );
          }
          else return Container(
            child: ListView(
              children: getTrackList(musicTrackBloc.trackPaths),
            ),
          );
        },
      ),
    );
  }

  List<Widget> getTrackList(List<String> trackList) {
    return trackList.map((item) {
      return ListTile(
        leading: Icon(Icons.play_arrow),
        title: Text(item.split('/').last),
      );
    }).toList();
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