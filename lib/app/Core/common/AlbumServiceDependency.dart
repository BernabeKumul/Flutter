import 'package:app_demo/app/Core/Service/AlbumService.dart';
import 'package:flutter/foundation.dart';

@immutable
class AlbumServiceDependency {
  final AlbumService albumService;

  const AlbumServiceDependency({this.albumService});
}
