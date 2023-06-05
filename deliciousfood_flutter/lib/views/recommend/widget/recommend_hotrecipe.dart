import 'package:deliciousfood_flutter/common/widgets/cached_image.dart';
import 'package:deliciousfood_flutter/models/home/home_recommend_model.dart';
import 'package:deliciousfood_flutter/models/home/home_recommend_video_model.dart';
import 'package:flutter/material.dart';

class RecommendHotRecipe extends StatefulWidget {
  final HomeRecommendModel model;
  const RecommendHotRecipe({super.key, required this.model});

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
          height: 250,
          child: ListView.separated(
            padding: const EdgeInsets.all(20),
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: widget.model.videoInfo?.length ?? 0,
            itemBuilder: (context, index) {
              HomeRecommendVideoInfoModel? videoModel =
                  widget.model.videoInfo?[index];
              return SizedBox(
                width: 140,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: netWorkImage(videoModel?.video?.img ?? "",
                          height: double.infinity, fit: BoxFit.fitHeight),
                    ),
                    Positioned(
                        left: 10,
                        top: 10,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: const Color(0x88000000),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Image.asset(
                              "resource/images/player_play.png",
                              width: 10,
                              height: 10,
                            ),
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                videoModel?.title ?? "",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  ClipOval(
                                    child: netWorkImage(
                                      videoModel?.author?.avatarUrl ?? "",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Text(
                                    videoModel?.author?.nickname ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ))
                                ],
                              )
                            ],
                          ),
                        ))
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
