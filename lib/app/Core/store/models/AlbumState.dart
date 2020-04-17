
import 'package:app_demo/app/Core/models/Album.dart';
import 'package:flutter/cupertino.dart';

class AlbumState{
  final bool isLoading;
  final bool loadingError;
  final List<Album> albums;

  AlbumState({
    @required this.isLoading,
    @required this.loadingError,
    @required this.albums
  });

  factory AlbumState.initial(){
    return new AlbumState(isLoading: false, loadingError: false, albums: new List<Album>());
  }

  AlbumState copyWith({
    bool isLoading, 
    bool loadingError,
    List<Album> albums
  }){
   return new AlbumState(
     isLoading: isLoading ?? this.isLoading,
     loadingError: loadingError ?? this.loadingError,
      albums: albums ?? this.albums);
  }

  @override
  int get hasCode => isLoading.hashCode ^ albums.hashCode;
}