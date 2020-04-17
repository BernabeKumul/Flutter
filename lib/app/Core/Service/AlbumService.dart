import 'dart:convert';
import 'dart:io';
import 'package:app_demo/app/Core/exception/exception.dart';
import 'package:app_demo/app/Core/models/Album.dart';
import 'package:http/http.dart' as http;

class AlbumService {
  final String _baseAddress;

  AlbumService(this._baseAddress);

  Future<List<Album>> getAll() async {
    final response = await _get('/values');

    final decodedTasks = json.decode(response.body) as List;

    return decodedTasks.map((jsonTask) => Album.fromJson(jsonTask)).toList();
  }

  Future<http.Response> _get(String endpoint) async {
    try {
      final response = await http.get(
        '$_baseAddress$endpoint',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
        },
      );

      return returnResponseOrThrowException(response);
    } on IOException catch (e) {
      print(e.toString());
      throw NetworkException();
    }
  }

  http.Response returnResponseOrThrowException(http.Response response) {
    if (response.statusCode == 404) {
      throw ItemNotFoundException();
    } else if (response.statusCode > 400) {
      throw UnKnowApiException(response.statusCode);
    } else {
      return response;
    }
  }
}
