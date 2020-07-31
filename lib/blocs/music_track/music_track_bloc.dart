import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'music_track_event.dart';
part 'music_track_state.dart';

class MusicTrackBloc extends Bloc<MusicTrackEvent, MusicTrackState> {
  MusicTrackBloc() : super(MusicTrackInitial());

  @override
  Stream<MusicTrackState> mapEventToState(
    MusicTrackEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
