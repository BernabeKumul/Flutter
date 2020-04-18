import 'package:app_demo/app/Core/models/Album.dart';
import 'package:app_demo/app/Core/store/effects/albumEfects.dart';
import 'package:app_demo/app/Core/store/models/appState.dart';
import 'package:redux/redux.dart';

class AlbumsProps{
  final Function getAlbums;
  final bool isLoading;
  final List<Album> lstAlbums;

  AlbumsProps({ this.isLoading, this.getAlbums, this.lstAlbums});
}

AlbumsProps mapToProps(Store<AppState> store){
      return AlbumsProps(
        lstAlbums: store.state.albumState.albums,
        isLoading:  store.state.albumState.isLoading,
        getAlbums: () async{
          store.dispatch(fetchAbumsAction());
        }
      );
}