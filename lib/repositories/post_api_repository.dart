import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_application_ceiba/env/environment.dart';
import 'package:flutter_application_ceiba/models/post_model.dart';

class PostAPIRepository {
  
  Future<List<PostModel>> getPostByUser(String id) async{
    final url      = Uri.parse('${Environment.baseUrl}/posts?userId=$id');
    final response = await http.get(url);
    
    if(response.statusCode == 200){
      List<dynamic> listResult = jsonDecode(response.body);
      return listResult.map(((e) => PostModel.fromJson(e))).toList();

    } throw Exception(response.reasonPhrase); 
  }
}