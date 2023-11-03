
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/category_model.dart';
import '../screens/categores_tab.dart';
import '../screens/drawer.dart';
import '../screens/news_tab.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> catories = CategoryModel.getCategories();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
          drawer: DrawerTab(onDrawerClicked),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.green,
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18))),
            title: Text("News"),
          ),
          body: categoryModel == null
              ? CategoriesTab(catories, onCategoryClicked)
              : NewsTab(categoryModel!.id)),
    );
  }

  CategoryModel? categoryModel = null;

  onCategoryClicked(category) {
    categoryModel = category;
    setState(() {});
  }

  onDrawerClicked(id) {
    if (id == DrawerTab.CAT_ID) {
      categoryModel = null;
    } else if (id == DrawerTab.SETT_ID) {}
    setState(() {
      Navigator.pop(context);
    });
  }
}