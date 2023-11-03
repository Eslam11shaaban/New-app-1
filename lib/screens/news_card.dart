import 'package:flutter/material.dart';

import '../Models/NewsResponse.dart';


class NewsCardItem extends StatelessWidget {
  Articles articles;

  NewsCardItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
          Image.network(
            articles.urlToImage ?? "",
            fit: BoxFit.fill,
          ),
          Text(articles.title??""),
          Text(articles.description??""),
          Row(
            children: [
              Text(articles.author??""),
              Text(articles.publishedAt??""),
            ],
          ),
        ]
        )
    );
  }
}
