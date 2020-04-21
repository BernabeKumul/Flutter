
import 'package:app_demo/app/Core/models/perfil.dart';
import 'package:meta/meta.dart';

@immutable
class PerfilState{
  final bool isLoading;
  final bool loadingError;
  final Perfil perfil;

  PerfilState({
    @required this.isLoading,
    @required this.loadingError,
    @required this.perfil
  });

  factory PerfilState.initial(){
    return new PerfilState(isLoading: false, loadingError: false, perfil: new Perfil());
  }

  PerfilState copyWith({
    bool isLoading, 
    bool loadingError,
    Perfil perfil
  }){
   return new PerfilState(
     isLoading: isLoading ?? this.isLoading,
     loadingError: loadingError ?? this.loadingError,
      perfil: perfil ?? this.perfil);
  }

   @override
  int get hasCode => isLoading.hashCode ^ perfil.hashCode;
}