import 'package:app_demo/app/Core/Service/perfil_service.dart';
import 'package:flutter/foundation.dart';

@immutable
class PerfilServiceDependency {
  final PerfilService perfilService;

  const PerfilServiceDependency({this.perfilService});
}