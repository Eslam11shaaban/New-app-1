import 'package:flutter/material.dart';

import '../Models/category_model.dart';
import 'category_item.dart';

class CategoriesTab extends StatelessWidget {
  List<CategoryModel> categories;
  Function onClick;

  CategoriesTab(this.categories, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Pick your category of interest",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
            children: categories
                .map((cat) => InkWell(
                    onTap: () {
                      onClick(cat);
                    },
                    child: CategoryItem(cat)))
                .toList(),
          ),
        )
      ],
    );
  }
}
