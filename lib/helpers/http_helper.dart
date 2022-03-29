import 'dart:typed_data';

import 'dart:convert';

import 'package:http/http.dart' as http;

final Map<String, String> customHeaders = {
  "Content-Type": "application/json",
  "Authorization": ""
};

class HttpHelper implements http.BaseClient {
  final String baseUrl;
  late http.Client client = http.Client();

  HttpHelper(this.baseUrl) {
    client = http.Client();
  }

  @override
  void close() {
    client.close();
  }

  @override
  Future<http.Response> delete(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    var custUrl = Uri.parse('$baseUrl/${url.path}');
    return client.delete(
      custUrl,
      headers: customHeaders,
      body: json.encode(body),
    );
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    var custUrl = Uri.parse('$baseUrl/${url.path}');
    return client.get(custUrl, headers: customHeaders);
  }

  @override
  Future<http.Response> head(Uri url, {Map<String, String>? headers}) {
    var custUrl = Uri.parse('$baseUrl/${url.path}');
    return client.head(custUrl, headers: customHeaders);
  }

  @override
  Future<http.Response> patch(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    var custUrl = Uri.parse('$baseUrl/${url.path}');
    return client.patch(custUrl,
        headers: customHeaders, body: json.encode(body));
  }

  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    var custUrl = Uri.parse('$baseUrl/${url.path}');
    return client.post(custUrl,
        headers: customHeaders, body: json.encode(body));
  }

  @override
  Future<http.Response> put(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    var custUrl = Uri.parse('$baseUrl/${url.path}');
    return client.put(custUrl, headers: customHeaders, body: json.encode(body));
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) {
    var custUrl = Uri.parse('$baseUrl/${url.path}');
    return client.read(custUrl, headers: customHeaders);
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) {
    var custUrl = Uri.parse('$baseUrl/${url.path}');
    return client.readBytes(custUrl, headers: customHeaders);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return client.send(request);
  }
}
