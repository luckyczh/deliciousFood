import 'package:deliciousfood_flutter/models/home/home_feed_model.dart';
import 'package:deliciousfood_flutter/models/home/home_feed_recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../common/utils/utils.dart';

class RecommendFeedRecipe extends StatefulWidget {
  final HomeFeedModel model;
  final int? index;
  const RecommendFeedRecipe({
    super.key,
    required this.model,
    this.index,
  });
  @override
  State<RecommendFeedRecipe> createState() => _RecommendFeedRecipeState();
}

class _RecommendFeedRecipeState extends State<RecommendFeedRecipe> {
  late final HomeFeedRecipeModel? model;

  @override
  void initState() {
    super.initState();
    model = widget.model.type == "1"
        ? widget.model.recipe
        : widget.model.videoRecipe;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: netWorkImage(model?.img ?? "",
                        width: 150, height: 150)),
                Align(
                    widthFactor: 5,
                    heightFactor: 5,
                    child: Visibility(
                      visible: widget.model.type == "7",
                      child: Image.asset(
                        "resource/images/play_normal.png",
                        width: 30,
                        height: 30,
                      ),
                    )),
                Positioned(
                  left: 10,
                  top: 0,
                  child: _rankView(widget.index),
                )
              ],
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
                Text(
                  model?.title ?? "",
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                _descWidget(),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: (model?.shicai ?? [])
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
        ));
  }

  Widget _descWidget() {
    return (model?.label?.isNotEmpty ?? false)
        ? Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              model?.label!.first.desc ?? "",
              style: const TextStyle(color: Colors.black54, fontSize: 14),
            ),
          )
        : const SizedBox();
  }

  Widget _rankView(int? index) {
    return index == null
        ? const SizedBox()
        : Container(
            height: 35,
            width: 23,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                color: _rankBgColor(index)),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "TOP",
                  style: TextStyle(
                      color: _textColor(index),
                      fontSize: 7,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$index",
                  style: TextStyle(
                      color: _textColor(index),
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
  }

  Color _textColor(int index) {
    return (index < 4) ? Colors.brown : Colors.white;
  }

  Color _rankBgColor(int index) {
    return (index < 4) ? Colors.amber.shade300 : Colors.brown;
  }
}
