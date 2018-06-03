import 'dart:async';
import 'package:http/http.dart';
import 'package:schedule_web_client/src/api/api.dart';
import 'package:schedule_web_client/src/api/api_transport.dart';
import 'package:schedule_web_client/src/api/endpoint.dart';
import 'package:schedule_web_client/src/api/endpoint_storage.dart';
import 'package:schedule_web_client/src/models/group.dart';

class GroupApi extends RestApi {
  ApiTransport _transport;
  Client _client;

  GroupApi(this._client, EndpointStorage endpoints) : super(endpoints) {
    _transport = new ApiTransport();
  }

  Future<List<Group>> getAll() async {
    final uri = getUri(Endpoint.GROUPS);
    final response = await _transport.send(_client, uri);
    final json = _transport.extractData(response);

    return json.map((value) => new Group.fromShortJson(value)).toList();
  }

  Future<Group> get(int id) async {
    final uri = getDetailedUri(Endpoint.GROUPS, "${id}");
    final response = await _transport.send(_client, uri);
    final json = _transport.extractData(response);

    return new Group.fromDetailedJson(json);
  }
}
