
import 'package:app_demo/app/Core/models/Album.dart';

class StartLoadingAlbumAction{
  StartLoadingAlbumAction();
}

class AlbumSuccessAction{
  final List<Album> data;

  AlbumSuccessAction(this.data);
}

class AlbumFailedAction{
  AlbumFailedAction();
}