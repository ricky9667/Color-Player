part of 'music_track_bloc.dart';

abstract class MusicTrackState {}

class InitialTrackState extends MusicTrackState {

}

class PlayTrackState extends MusicTrackState {
  final int trackIndex;

  PlayTrackState({@required this.trackIndex}) : assert(trackIndex != null);
}

class PauseTrackState extends MusicTrackState {
  final int prevIndex;

  PauseTrackState({@required this.prevIndex}) : assert(prevIndex != null);
}