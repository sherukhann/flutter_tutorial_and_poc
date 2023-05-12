import 'dart:convert';

import 'package:byjus_network/api_services.dart';
import 'package:flutter/cupertino.dart';

import '../models/users_model.dart';

class UsersRepo {
  Future<List<UsersModel>> getUsers() async {
    var response = await ApiClient().get('https://jsonplaceholder.typicode.com/users');
    debugPrint("users -> response   ${jsonEncode(response).runtimeType}");
    final List<UsersModel> usersModel = usersModelFromJson(jsonEncode(response));
    debugPrint("users -> total users: ${usersModel.length}");
    debugPrint("users -> user 1 title: ${usersModel[0].name}");
    return usersModel;
  }
}