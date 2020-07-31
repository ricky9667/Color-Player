part of 'audio_path_bloc.dart';

@immutable
abstract class AudioPathState {}

class InitialAudioPathState extends AudioPathState {}

class FetchPathState extends AudioPathState {
  final List<String> trackPaths;

  FetchPathState({@required this.trackPaths});
}