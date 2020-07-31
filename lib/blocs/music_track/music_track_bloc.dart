import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'music_track_event.dart';

part 'music_track_state.dart';

class MusicTrackBloc extends Bloc<MusicTrackEvent, MusicTrackState> {
  MusicTrackBloc() : super(InitialMusicTrackState());

  @override
  Stream<MusicTrackState> mapEventToState(
    MusicTrackEvent event,
  ) async* {

  }
}
