part of 'music_track_bloc.dart';

@immutable
abstract class MusicTrackState {}

class InitialMusicTrackState extends MusicTrackState {}

class FetchPathState extends MusicTrackState {
  final List<String> trackPaths;
  FetchPathState({@required this.trackPaths});
}