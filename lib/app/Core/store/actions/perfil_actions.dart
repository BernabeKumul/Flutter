import 'package:app_demo/app/Core/models/Album.dart';
import 'package:app_demo/app/Core/models/perfil.dart';

class StartLoadingPerfilAction{
  StartLoadingPerfilAction();
}

class PerfilSuccessAction{
  final Perfil data;

  PerfilSuccessAction(this.data);
}

class PerfilFailedAction{
  PerfilFailedAction();
}