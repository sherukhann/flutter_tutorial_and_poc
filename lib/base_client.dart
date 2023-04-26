import 'dart:convert';

import 'package:http/http.dart' as http;
const String baseUrl = 'https://jsonplaceholder.typicode.com';

class BaseClient {
  var client  = http.Client();
  Future<dynamic> get(String api) async{
    var url = Uri.parse(baseUrl + api);
    // haeders is Map<string, string> type
    // var headers = {
    //   'Authorization': 'Bearer dsadsa=',
    //   'api_key': 'bdsabdksafdahdfsaf'
    // };

    var response = await client.get(url);
    if(response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
  Future<dynamic> post(String api, dynamic data) async{
    var url = Uri.parse(baseUrl + api);
    // haeders is Map<string, string> type
    var headers = {
      'Content-Type': 'application/json'
      // 'Authorization': 'Bearer dsadsa=',
      // 'api_key': 'bdsabdksafdahdfsaf'
    };
    var payload = json.encode(data);
    var response = await client.post(url, body: payload, headers: headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
  Future<dynamic> put(String api, dynamic data) async{
    var url = Uri.parse(baseUrl + api);
    // haeders is Map<string, string> type
    var headers = {
      'Content-Type': 'application/json'
      // 'Authorization': 'Bearer dsadsa=',
      // 'api_key': 'bdsabdksafdahdfsaf'
    };
    var payload = json.encode(data);
    var response = await client.put(url, body: payload, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
  Future<dynamic> delete(String api) async{
    var url = Uri.parse(baseUrl + api);
    // haeders is Map<string, string> type
    // var headers = {
    //   'Authorization': 'Bearer dsadsa=',
    //   'api_key': 'bdsabdksafdahdfsaf'
    // };

    var response = await client.delete(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}