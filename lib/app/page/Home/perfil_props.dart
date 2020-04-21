import 'package:app_demo/app/Core/models/Album.dart';
import 'package:app_demo/app/Core/models/perfil.dart';
import 'package:app_demo/app/Core/store/effects/albumEfects.dart';
import 'package:app_demo/app/Core/store/effects/perfil_efects.dart';
import 'package:app_demo/app/Core/store/models/appState.dart';
import 'package:redux/redux.dart';

class PerfilProps{
  final Function getUser;
  final bool isLoading;
  final Perfil perfil;

  PerfilProps({ this.isLoading, this.getUser, this.perfil});
}

PerfilProps mapPerfilToProps(Store<AppState> store){
      return PerfilProps(
        perfil: store.state.perfilState.perfil,
        isLoading:  store.state.albumState.isLoading,
        getUser: () async{
          store.dispatch(fetchPerfilAction());
        }
      );
}