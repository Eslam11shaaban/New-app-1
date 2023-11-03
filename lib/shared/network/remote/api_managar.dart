import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';


import '../../../Models/NewsResponse.dart';
import '../../../Models/sourses_models.dart';
import '../../constant.dart';
class ApiManager{
  static Future<SourcesResponse> getSources()async{
  Uri url=Uri.https(BASE_URL,"/v2/top-headlines/sources",{
    "apiKey":"689232e31d7c44fa81d0d439a9f23faa"
  });
  Response response=await http.get(url);
  var jsonData=jsonDecode(response.body); 
  SourcesResponse data=SourcesResponse.fromJson(jsonData);
  return data;


}
static Future<NewsResponse>getNewsData(String sourceId)async{
    Uri url=Uri.http(BASE_URL,"/v2/everything",{
      "apiKey":API_KEY,
      "SOURCES":sourceId,
    });
   http.Response response=await http.get(url);
   var jsonData=jsonDecode(response.body);
   NewsResponse newsResponse=NewsResponse.fromJson(jsonData);
   return newsResponse;
}
}