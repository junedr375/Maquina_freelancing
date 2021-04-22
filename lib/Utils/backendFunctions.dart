import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:marquina/Utils/Utility.dart';

Future<Map> createSession(String userId) async {
  String apiUrl = baseUrl + 'user/create-session/';
  var response = await http.post(Uri.parse(apiUrl), body: {
    "session_in_time": DateTime.now().toUtc().toString(),
    "channel": "flutter_app",
    "user": userId.toString()
  });

  return jsonDecode(response.body);
}

Future<dynamic> updateSession(String sessionId) async {
  String apiUrl = baseUrl + 'user/update-session/';
  var response = await http.post(Uri.parse(apiUrl),
      body: jsonEncode({
        "session_id": int.parse(sessionId),
        "kwargs": {
          "session_out_time": DateTime.now().toUtc().toString(),
          "channel": "string"
        }
      }));

  //print(response.body);

  return jsonDecode(response.body);
}

Future<Map> getAnswer(String sessionId, String question) async {
  String apiUrl = baseUrl + 'main/api/v1/getResponseForaQuery';
  var response = await http.post(Uri.parse(apiUrl),
      body: {"session_id": sessionId, "question": question});

  return jsonDecode(response.body);
}
