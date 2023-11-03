import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app1/screens/tabs_contrller%5D.dart';


import '../shared/network/remote/api_managar.dart';

class NewsTab extends StatelessWidget {
  String catId;

  NewsTab(this.catId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Something is error"));
          }
          var sourses = snapshot.data?.sources ?? [];
          return TabControllerWisget(sourses);
        });
  }
}