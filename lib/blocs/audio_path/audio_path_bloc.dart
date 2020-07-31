import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

part 'audio_path_event.dart';
part 'audio_path_state.dart';

class AudioPathBloc extends Bloc<AudioPathEvent, AudioPathState> {
  AudioPathBloc() : super(InitialAudioPathState());

  static const String trackDirectoryPath = '/storage/emulated/0/Music/';
  final audioPlayer = AssetsAudioPlayer();
  List<String> trackPaths = [];

  @override
  Stream<AudioPathState> mapEventToState(
    AudioPathEvent event,
  ) async* {
    if (event is FetchPathEvent) {
      if (await Permission.storage.status != PermissionStatus.granted) {
        Permission.storage.request().isGranted;
      }
      trackPaths = await getTrackPaths(trackDirectoryPath);
      yield FetchPathState(trackPaths: trackPaths);
    }
  }

  Future<List<String>> getTrackPaths(String dirPath) async {
    bool isDirExist = Directory(dirPath).existsSync();
    if (!isDirExist) return [];

    List<FileSystemEntity> files = Directory(dirPath).listSync();
    List<String> trackPaths = [];
    for (FileSystemEntity file in files) {
      String path = file.path;
      if (path.endsWith('.mp3')) trackPaths.add(path);
    }
    return trackPaths;
  }
}
