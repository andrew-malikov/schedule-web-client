import 'dart:async';

import 'dart:math';
import 'package:angular/di.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:schedule_web_client/src/api/endpoint_storage.dart';
import 'package:schedule_web_client/src/api/group_api.dart';
import 'package:schedule_web_client/src/models/group.dart';

Client _getClient() {
  return new BrowserClient();
}

EndpointStorage _getEndpoints() {
  return new EndpointStorage();
}

@Injectable()
class GroupService {
  GroupApi _api;

  GroupService() {
    final client = _getClient();
    final endpoints = _getEndpoints();

    _api = new GroupApi(client, endpoints);
  }

  Future<Group> group() async {
    var groups = await _api.getAll();
    return await _api.get(groups[new Random().nextInt(groups.length)].id);
  }
}
