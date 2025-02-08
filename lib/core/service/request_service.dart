import 'dart:async';
import 'package:devlearn/core/interface/irequest_service.dart';
import 'package:devlearn/core/model/response_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RequestService implements IRequestService {
  final Duration _timeoutDefault = const Duration(seconds: 15);

  @override
  Future<ResponseModel> get(
    String endpoint,
  ) async {
    return await _sendRequest(
      () => http.get(
        Uri.parse(endpoint),
        headers: _headersDefault(),
      ),
    );
  }

  Future<ResponseModel> _sendRequest(
    Future<Response> Function() request,
  ) async {
    var response = await request().timeout(_timeoutDefault);
    return ResponseModel(
      statusCode: response.statusCode,
      body: _convertBody(response),
    );
  }

  Map<String, String> _headersDefault() {
    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    return headers;
  }

  String _convertBody(Response response) {
    if (response.body.isEmpty) {
      return '';
    }
    return response.body;
  }
}
