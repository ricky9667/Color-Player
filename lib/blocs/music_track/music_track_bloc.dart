import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'music_track_event.dart';

part 'music_track_state.dart';

class MusicTrackBloc extends Bloc<MusicTrackEvent, MusicTrackState> {
  MusicTrackBloc() : super(InitialMusicTrackState());

  static const String trackDirectoryPath = '/storage/emulated/0/Music/';
  List<String> trackPaths = [];

  @override
  Stream<MusicTrackState> mapEventToState(
    MusicTrackEvent event,
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

    print('MusicTrackBloc: directory exists');

    List<FileSystemEntity> files = Directory(dirPath).listSync();
    List<String> trackPaths = [];
    for (FileSystemEntity file in files) {
      String path = file.path;
      if (path.endsWith('.mp3')) trackPaths.add(path);
    }

    if (trackPaths.isEmpty) print('FUCK YOU');

    return trackPaths;
  }
}
