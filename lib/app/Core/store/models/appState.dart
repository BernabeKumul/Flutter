import 'package:app_demo/app/Core/store/models/AlbumState.dart';
import 'package:app_demo/app/Core/store/models/UserState.dart';
import 'package:app_demo/app/Core/store/models/perfil_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState{
  final UserState userState;
  final AlbumState albumState;
  final PerfilState perfilState;

  AppState({
    @required this.userState,
    @required this.albumState,
    @required this.perfilState
  });

  factory AppState.initial(){
    return AppState(userState: UserState.initial(), albumState: AlbumState.initial(), perfilState: PerfilState.initial());
  }

  AppState copyWith({UserState userState, AlbumState albumState, PerfilState perfilState}){
    return AppState(
      userState: userState ?? this.userState,
      albumState: albumState ?? this.albumState,
      perfilState: perfilState ?? this.perfilState
      );
  }

  @override
  int get hasCode => userState.hashCode;

  @override
  bool operator ==(Object other) => 
     identical(this, other) ||
        other is AppState && userState == other.userState;
}