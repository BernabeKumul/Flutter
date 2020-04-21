import 'package:app_demo/app/Core/models/Album.dart';
import 'package:app_demo/app/Core/models/perfil.dart';
import 'package:app_demo/app/Core/store/effects/albumEfects.dart';
import 'package:app_demo/app/Core/store/effects/perfil_efects.dart';
import 'package:app_demo/app/Core/store/models/appState.dart';
import 'package:redux/redux.dart';

class AlbumsProps{
  final Function getAlbums;
  final Function getUser;
  final bool isLoading;
  final List<Album> lstAlbums;
  final Perfil perfil;

  AlbumsProps({ this.isLoading, this.getAlbums,this.getUser, this.lstAlbums, this.perfil });
}

AlbumsProps mapToProps(Store<AppState> store){
      return AlbumsProps(
        lstAlbums: store.state.albumState.albums,
        perfil: store.state.perfilState.perfil,
        isLoading:  store.state.albumState.isLoading,
        getAlbums: () async{
          store.dispatch(fetchAbumsAction());
        },
        getUser: () async{
          store.dispatch(fetchPerfilAction());
        }
      );
}