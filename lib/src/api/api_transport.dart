import 'dart:async';

import 'dart:convert';
import 'package:http/http.dart';

class ApiTransport {
  Future<String> send(Client client, Uri uri) async {
    final headers = {"Access-Control-Allow-Origin": "*"};
    return (await client.get(uri, headers: headers)).body;
  }

  dynamic extractData(String data) => JSON.decode(data);
}
