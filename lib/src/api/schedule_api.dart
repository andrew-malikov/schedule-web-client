import 'dart:async';
import 'package:http/http.dart';
import 'package:schedule_web_client/src/api/api.dart';
import 'package:schedule_web_client/src/api/api_transport.dart';
import 'package:schedule_web_client/src/api/endpoint.dart';
import 'package:schedule_web_client/src/api/endpoint_storage.dart';
import 'package:schedule_web_client/src/models/schedule.dart';

class ScheduleApi extends RestApi {
  ApiTransport _transport;
  Client _client;

  ScheduleApi(this._client, EndpointStorage endpoints) : super(endpoints) {
    _transport = new ApiTransport();
  }

  Future<Schedule> get(int id) async {
    final uri = getDetailedUri(Endpoint.SCHEDULES, "${id}");
    final response = await _transport.send(_client, uri);
    final json = _transport.extractData(response);

    return new Schedule.fromJson(json);
  }
}
