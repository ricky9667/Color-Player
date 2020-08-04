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
          var audioPathBloc = context.bloc<AudioPathBloc>();
          if (audioPathBloc.trackPaths.isEmpty) {
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
          else
            return trackListView(audioPathBloc.trackPaths);
        },
      ),
    );
  }

  Widget trackListView(List<String> trackList) {
    int playingIndex = -1;
    bool isPlaying = false;
    return BlocBuilder<MusicTrackBloc, MusicTrackState>(
        builder: (context, state) {
          return ListView(
            children: trackList.asMap().map((index, item) {
              return MapEntry(index, ListTile(
                leading: ((isPlaying && playingIndex == index) ? Icon(Icons.pause) : Icon(Icons.play_arrow)),
                title: Text(item.split('/').last),
                onTap: () {
                  if (index == playingIndex && isPlaying) {
                    context.bloc<MusicTrackBloc>().add(PauseTrackEvent(trackIndex: index));
                    isPlaying = false;
                  } else {
                    playingIndex = index;
                    context.bloc<MusicTrackBloc>().add(PlayTrackEvent(trackIndex: index, trackPath: trackList[index]));
                    isPlaying = true;
                  }
                },
              ));
            }).values.toList(),
          );
        }
    );
  }
}
