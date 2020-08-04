import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'music_track_event.dart';

part 'music_track_state.dart';

class MusicTrackBloc extends Bloc<MusicTrackEvent, MusicTrackState> {
  MusicTrackBloc() : super(InitialTrackState());

  final audioPlayer = AssetsAudioPlayer();

  @override
  Stream<MusicTrackState> mapEventToState(
    MusicTrackEvent event,
  ) async* {
    if (event is PlayTrackEvent) {
      audioPlayer.open(Audio.file(event.trackPath));
      yield PlayTrackState(trackIndex: event.trackIndex);
    } else if (event is PauseTrackEvent) {
      audioPlayer.pause();
    }
  }
}
