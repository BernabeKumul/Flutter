import 'dart:convert';

import 'package:app_demo/app/Core/common/OnlineParams.dart';
import 'package:app_demo/app/Core/models/perfil.dart';

import 'ApiClient.dart';

class PerfilService extends ApiClient {
  final String _controller = "values";

  Future<Perfil> getAll() async {
    final response =
        await Get(new OnlineParams(controller: _controller, idEntity: "1"));

    final decodedTasks = json.decode(response.body);

    Perfil perfil = new Perfil.fromJson(decodedTasks);
    return perfil;
    // return decodedTasks.map((jsonTask) => Perfil.fromJson(jsonTask));
  }
}
