import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Universal video player for flutter
/// Support platform: Android, iOS, MacOS, Windows, Linux and Web
/// We use video_player for Android and media_kit for iOS, MacOS, Windows and Linux
/// Support source: assets, file, network
/// Methods: play, pause, seek, setVolume, setPlaybackSpeed, setLooping
/// Value: aspectRatio, buffered, duration, hasError, errorMessage, playbackSpeed, position, size, volume
/// isBuffering, isInitialized, isLooping, isPlaying
/// EventStream: positionStream,
/// Init parameters: initialDuration
abstract class FlutterBasePlayerPlatform extends PlatformInterface {
  FlutterBasePlayerPlatform() : super(token: _token);

  static final Object _token = Object();

  static late FlutterBasePlayerPlatform Function() instance;

  void setProperty(String property, String value);

  Future<void> assets(
    String path, {
    int? bufferSize,
    LogLevel? logLevel,
  });
  Future<void> file(
    File file, {
    int? bufferSize,
    LogLevel? logLevel,
  });
  Future<void> network(
    String url, {
    Map? headers,
    int? bufferSize,
    LogLevel? logLevel,
  });

  void initialize();
  void dispose();
  void play();
  void pause();
  void replay();
  void seek(Duration position);
  void setVolume(double volume);
  void setPlaybackSpeed(double speed);
  void setLooping(bool looping);
  void setVideoTrack(BaseTrack track);
  void setAudioTrack(BaseTrack track);
  void setSubtitleTrack(BaseTrack track);

  // Returns [size.width] / [size.height].
  // Will return 1.0 if:
  // [isInitialized] is false
  // [size.width], or [size.height] is equal to 0.0
  // aspect ratio would be less than or equal to 0.0
  double get aspectRatio;
  double get buffered;
  bool get completed;
  Duration get duration;
  bool get hasError;
  String? get errorMessage;
  double get playbackSpeed;
  Duration get position;
  Size get size;
  double get volume;
  bool get isBuffering;
  bool get isInitialized;
  bool get isLooping;
  bool get isPlaying;
  BaseTrack? get videoTrack;
  List<BaseTrack?> get videoTracks;
  BaseTrack? get audioTrack;
  List<BaseTrack?> get audioTracks;
  BaseTrack? get subtitleTrack;
  List<BaseTrack?> get subtitleTracks;

  ChangeNotifier get eventStream;
  ChangeNotifier get precompleteStream;

  // fit decide the video cut style
  // builder is constrained by parent widget
  // ratio for container height calc, it may conflict with box`s maxHeight
  Widget builder(BuildContext context,
      [BoxFit? fit, double? ratio, Color? color]);
}

class BaseTrack {
  String? id;
  String? title;
  String? language;
  dynamic raw;

  BaseTrack({
    this.id,
    this.title,
    this.language,
    this.raw,
  });
}

enum LogLevel { none, trace, debug, info, warn, error, fatal }
