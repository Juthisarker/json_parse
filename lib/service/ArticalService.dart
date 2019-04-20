import 'dart:async';
import 'package:http/http.dart' as http ;
import 'dart:convert';

import '../Model/Article.dart';

class ArticalService{
  static Future<Article> getArticle() async{
    Article article = new Article();
    try{
var data = await http.get('https://reqres.in/api/users?page=2');

if(data.statusCode!=200)return null;
Map jsonData= json.decode(data.body); 

article= Article.fromJson(jsonData);
return article;

    }catch(e){
      return null;
    }
    
  }
}