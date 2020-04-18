import 'dart:convert';
import 'package:app_demo/app/Core/Service/ApiClient.dart';
import 'package:app_demo/app/Core/common/OnlineParams.dart';
import 'package:app_demo/app/Core/models/Album.dart';

class AlbumService extends ApiClient {
  final String _controller = "values";

  Future<List<Album>> getAll() async {
    final response = await Get(new OnlineParams(
      controller: _controller
    ));

    final decodedTasks = json.decode(response.body) as List;

    return decodedTasks.map((jsonTask) => Album.fromJson(jsonTask)).toList();
  }
}
