import 'package:deliciousfood_flutter/common/network/base/client.dart';
import 'package:deliciousfood_flutter/common/network/extension/home_client.dart';
import 'package:deliciousfood_flutter/models/category/category_model.dart';
import 'package:flutter/material.dart';

import '../../common/utils/utils.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late List<CategoryModel> list;

  _getCategories() async {
    list = await client.getCategories();
    setState(() {});
  }

  @override
  void initState() {
    list = [];
    _getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("菜谱分类"),
        forceMaterialTransparency: true,
      ),
      body: list.isEmpty
          ? loadingWidget()
          : GridView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return _categoryItem(list[index]);
              },
            ),
    );
  }

  Widget _categoryItem(CategoryModel model) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          netWorkImage(model.iconSelected, width: 50, height: 50),
          Text(model.title ?? "")
        ],
      ),
    );
  }
}
