import 'dart:async';

import 'package:angular/di.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:schedule_web_client/src/api/endpoint_storage.dart';
import 'package:schedule_web_client/src/api/schedule_api.dart';
import 'package:schedule_web_client/src/models/schedule.dart';

Client _getClient() {
  return new BrowserClient();
}

EndpointStorage _getEndpoints() {
  return new EndpointStorage();
}

@Injectable()
class ScheduleService {
  ScheduleApi _scheduleApi;

  ScheduleService() {
    final client = _getClient();
    final endpoints = _getEndpoints();

    _scheduleApi = new ScheduleApi(client, endpoints);
  }

  Future<Schedule> schedule(int id) async {
    return await _scheduleApi.get(id);
  }
}
