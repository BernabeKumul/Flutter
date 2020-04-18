import 'dart:io';
import 'package:app_demo/app/Core/common/OnlineParams.dart';
import 'package:app_demo/app/Core/exception/exception.dart';
import 'package:http/http.dart' as http;

class ApiClient{
    String _urlBase = 'https://192.168.0.101:44380/api/';

    Future<http.Response> Get(OnlineParams object) async {
        try {
          var url = _getUrl(object);
          final response = await http.get(
            url,
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

      String _getUrl(OnlineParams params){
        var url = '${this._urlBase}${params.controller}';
        url += (params.idEntity != null) ? '/${params.idEntity}' : "";
        url += (params.action != null) ? '/${params.action}' : "";
        // url += `${params.query ? params.query.getQueryParams() : ""}`;
        return url;
    }
}