import 'package:deliciousfood_flutter/common/widgets/cached_image.dart';
import 'package:deliciousfood_flutter/models/home/home_feed_recipe_model.dart';
import 'package:flutter/material.dart';

class RecommendFeedRecipe extends StatefulWidget {
  final HomeFeedRecipeModel model;
  const RecommendFeedRecipe({super.key, required this.model});
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
              child: netWorkImage(widget.model.img ?? "",
                  width: 120, height: 120)),
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
              Text(
                widget.model.title ?? "",
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              _descWidget(),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 5,
                children: (widget.model.shicai ?? [])
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

  Widget _descWidget() {
    return (widget.model.label?.isNotEmpty ?? false)
        ? Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              widget.model.label!.first.desc ?? "",
              style: const TextStyle(color: Colors.black54, fontSize: 14),
            ),
          )
        : const SizedBox();
  }
}
