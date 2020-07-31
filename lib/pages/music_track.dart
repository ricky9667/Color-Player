import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color_player/blocs/audio_path/audio_path_bloc.dart';
import 'package:flutter_color_player/blocs/music_track/music_track_bloc.dart';

class MusicTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Track'),
      ),
      body: BlocBuilder<AudioPathBloc, AudioPathState>(
        builder: (context, state) {
          AudioPathBloc audioPathBloc = context.bloc<AudioPathBloc>();
          if(audioPathBloc.trackPaths.isEmpty) {
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
              children: getTrackList(audioPathBloc.trackPaths),
            ),
          );
        },
      ),
    );
  }

  List<Widget> getTrackList(List<String> trackList) {
    return trackList.asMap().map((index, item) {
      return MapEntry(index, ListTile(
          leading: Icon(Icons.play_arrow),
          title: Text(item.split('/').last),
          onTap: () {
            // play/pause
          }),
      );
    }).values.toList();
  }

  void playTrack(String audioPath) {
    final audioPlayer = AssetsAudioPlayer();
    try {
      Audio file = Audio.file(audioPath);
      audioPlayer.open(file);
    }
    catch (e){
      print('ERROR READING AUDIO FILE');
      print(e.toString());
    }
  }
}