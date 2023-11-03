import 'package:flutter/material.dart';
import 'package:news_app1/screens/source_item.dart';

import '../Models/sourses_models.dart';
import '../shared/network/remote/api_managar.dart';
import 'news_card_item_news.dart';
class TabControllerWisget extends StatefulWidget {
  List<Sources> sources;

  TabControllerWisget(this.sources);

  @override
  State<TabControllerWisget> createState() => _TabControllerWisgetState();
}

class _TabControllerWisgetState extends State<TabControllerWisget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sources
                    .map((source) => Tab(
                          child: SourceItem(source,
                              widget.sources.indexOf(source) == selectedIndex),
                        ))
                    .toList())),
        FutureBuilder(
            future:
                ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Something is error"));
              }
              var newList=snapshot.data?.articles??[];
              return Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return NewsCardItem(newList[index]);
                },itemCount: newList.length,),
              );
            })
      ],
    );
  }
}
