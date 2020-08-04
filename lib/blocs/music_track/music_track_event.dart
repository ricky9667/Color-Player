part of 'music_track_bloc.dart';

@immutable
abstract class MusicTrackEvent {}

class PlayTrackEvent extends MusicTrackEvent {
  final int trackIndex;
  final String trackPath;

  PlayTrackEvent({@required this.trackIndex, @required this.trackPath})
      : assert(trackIndex != null),
        assert(trackPath != null);
}

class PauseTrackEvent extends MusicTrackEvent {
  final int trackIndex;

  PauseTrackEvent({@required this.trackIndex}) : assert(trackIndex != null);
}