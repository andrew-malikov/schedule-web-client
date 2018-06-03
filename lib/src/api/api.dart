import 'package:schedule_web_client/src/api/endpoint.dart';
import 'package:schedule_web_client/src/api/endpoint_storage.dart';

abstract class RestApi {
  EndpointStorage _endpoints;

  RestApi(this._endpoints);

  String get base => _endpoints.get(Endpoint.BASE);

  Uri getUri(Endpoint endpoint) {
    return Uri.parse("${base}${_endpoints.get(endpoint)}");
  }

  Uri getDetailedUri(Endpoint endpoint, String data) {
    return Uri.parse("${base}${_endpoints.get(endpoint)}/${data}");
  }
}
