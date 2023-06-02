import 'package:flutter/material.dart';

class RecommendFeedRecipe extends StatefulWidget {
  const RecommendFeedRecipe({super.key});

  @override
  State<RecommendFeedRecipe> createState() => _RecommendFeedRecipeState();
}

class _RecommendFeedRecipeState extends State<RecommendFeedRecipe> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              "https://st-cn.meishi.cc/scene/upload/img/7675731_162201874687076.jpg",
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "油焖大虾",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const Text(
                "磷元素有助心脏规律跳动，维持肾脏正常机能和传达神经活动。",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 5,
                children: ["白菜", "豆腐", "带皮五花肉"]
                    .map((e) => Container(
                          padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
                          decoration: BoxDecoration(
                              color: Colors.amber.shade100,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            e,
                            style: TextStyle(
                                color: Colors.brown.shade400,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                    .toList(),
              )
            ],
          ))
        ],
      ),
    );
  }
}
