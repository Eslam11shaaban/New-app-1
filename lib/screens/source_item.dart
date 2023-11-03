import 'package:flutter/material.dart';

import '../Models/sourses_models.dart';


class SourceItem extends StatelessWidget {
  Sources source;
  bool selected;


  SourceItem(this.source, this.selected,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5,bottom: 5,right: 10,left: 10),
      decoration: BoxDecoration(

      color: selected?Colors.green:Colors.transparent,
      borderRadius: BorderRadius.circular(25),
      border: Border.all(color: Colors.green)
    ),
    child: Text(source.name ?? "",style: TextStyle(color: selected?Colors.white:Colors.green),),);
  }
}
