import 'package:schedule_web_client/src/api/endpoint.dart';


class EndpointStorage {
  Map<Endpoint, String> endpoints = {
    Endpoint.BASE: "http://185.159.131.150/",
    Endpoint.GROUPS: "groups",
    Endpoint.SCHEDULES: "groups/schedules"
  };

  String get(Endpoint key) {
    final value = endpoints[key];

    if (value == null) throw new ArgumentError();

    return value;
  }
}
