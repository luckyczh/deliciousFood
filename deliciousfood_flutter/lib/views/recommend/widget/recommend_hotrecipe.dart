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
          height: 250,
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
                width: 140,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.red),
                child: Stack(
                  children: [
                    Image.network(
                      "https://img2.baidu.com/it/u=3628561281,1488805814&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                      height: double.infinity,
                      fit: BoxFit.fitHeight,
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
                          // decoration:
                          // const BoxDecoration(color: Color(0x22000000)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "三汁焖锅",
                                style: TextStyle(
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
                                    child: Image.network(
                                      "https://st-cn.meishi.cc/user/239/212/ns13115739_153509264588394.jpg",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "多味小厨房",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
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
