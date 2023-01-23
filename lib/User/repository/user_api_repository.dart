import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_application_ceiba/env/environment.dart';
import 'package:flutter_application_ceiba/User/model/user_model.dart';

class UserAPIRepository {
    
  Future<List<UserModel>> getUsers() async{
    final url      = Uri.parse('${Environment.baseUrl}/users');
    final response = await http.get(url);

    if(response.statusCode == 200){
      List<dynamic> listResult = jsonDecode(response.body);
      return listResult.map(((e) => UserModel.fromJson(e))).toList();

    } throw Exception(response.reasonPhrase); 
  }
  
}