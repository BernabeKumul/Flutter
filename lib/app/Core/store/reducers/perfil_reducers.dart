import 'package:app_demo/app/Core/store/actions/perfil_actions.dart';
import 'package:app_demo/app/Core/store/models/perfil_state.dart';
import 'package:redux/redux.dart';

final perfilReducer = combineReducers<PerfilState>(
  [
      TypedReducer<PerfilState,PerfilSuccessAction >(_perfilSuccess),
      TypedReducer<PerfilState,PerfilFailedAction >(_perfilFailed),
      TypedReducer<PerfilState,StartLoadingPerfilAction >(_perfilloading),
  ]
);


PerfilState _perfilSuccess(PerfilState state, PerfilSuccessAction action){
  return state.copyWith(
    isLoading: false,
    loadingError: false,
    perfil: action.data
  );
}

PerfilState _perfilFailed(PerfilState state, PerfilFailedAction action){
  return state.copyWith(
    isLoading: false,
    loadingError: true,
    perfil: null
  );
}

PerfilState _perfilloading(PerfilState state, StartLoadingPerfilAction action){
  return state.copyWith(
    isLoading: true,
    loadingError: false,
    perfil: null
  );
}