import 'package:flutter/material.dart';

class RecommendHotRecipe extends StatefulWidget {
  const RecommendHotRecipe({super.key});

  @override
  State<RecommendHotRecipe> createState() => _RecommendHotRecipeState();
}

class _RecommendHotRecipeState extends State<RecommendHotRecipe> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "每日热门菜谱",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.all(20),
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                width: 120,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.red),
                child: Stack(
                  children: [
                    Image.network(
                      "https://img2.baidu.com/it/u=3628561281,1488805814&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                      height: double.infinity,
                      fit: BoxFit.fitHeight,
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
