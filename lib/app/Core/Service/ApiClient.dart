import 'dart:io';
import 'package:app_demo/app/Core/exception/exception.dart';
import 'package:http/http.dart' as http;

class ApiClient{

    Future<http.Response> Get(String endpoint) async {
        try {
          final response = await http.get(
            '$endpoint',
            headers: {
              HttpHeaders.acceptHeader: 'application/json',
            },
          );

          return _returnResponseOrThrowException(response);
        } on IOException catch (e) {
          print(e.toString());
          throw NetworkException();
        }
      }

      http.Response _returnResponseOrThrowException(http.Response response) {
        if (response.statusCode == 404) {
          throw ItemNotFoundException();
        } else if (response.statusCode > 400) {
          throw UnKnowApiException(response.statusCode);
        } else {
          return response;
        }
      }
}