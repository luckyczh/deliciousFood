import 'package:flutter/material.dart';

class RecommendJieQi extends StatefulWidget {
  const RecommendJieQi({super.key});

  @override
  State<RecommendJieQi> createState() => _RecommendJieQiState();
}

class _RecommendJieQiState extends State<RecommendJieQi> {
  final List<Color> cardColors = [
    const Color(0x8FFCE4EC),
    const Color(0x5DFBE9CC),
    const Color(0x72E6C9E9),
    const Color(0x63C3E0F9)
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _topCard(),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: _bottomCard(true),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: _bottomCard(false)),
            ],
          ),
        )
      ],
    );
  }

  Widget _bottomCard(bool left) {
    return Container(
      height: 70,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color(0x22DDDADA),
                offset: Offset(10, 10),
                blurRadius: 20)
          ]),
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "resource/images/menu_${left ? "smart" : "category"}.png",
                height: 70,
                fit: BoxFit.fitHeight,
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  left ? "智能组菜" : "菜谱分类",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  left ? "有什么，吃什么" : "超多分类，精准筛选",
                  style: const TextStyle(color: Colors.black87),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _topCard() {
    return Card(
        shadowColor: const Color(0x22DDDADA),
        clipBehavior: Clip.hardEdge,
        elevation: 4,
        margin: const EdgeInsets.all(20),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF04860D),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                child: const Text(
                  "二十四节气养生食谱",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              )),
              Positioned(
                top: 0,
                right: 0,
                child: Image.network(
                  "https://st-cn.meishi.cc/p2/20221010/20221010161351_917.jpg",
                  height: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "小满",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "5月21日 - 6月5日",
                      style: TextStyle(
                          color: Color.fromARGB(255, 206, 199, 199),
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                        spacing: 10,
                        children: [
                          "皇冠",
                          "蒜苔",
                          "苦瓜",
                          "薏米",
                          "冬瓜",
                        ]
                            .map((e) => Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  decoration: BoxDecoration(
                                      color: Colors.green.shade50,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 13),
                                  ),
                                ))
                            .toList()),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2.5,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Container(
                          clipBehavior: Clip.hardEdge,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: cardColors[index],
                              borderRadius: BorderRadius.circular(6)),
                          child: const Row(
                            children: [
                              Expanded(
                                  child: Text(
                                "小满尝三鲜：黄瓜、蒜苔和樱桃",
                                style: TextStyle(color: Colors.black87),
                              )),
                              Icon(Icons.arrow_forward_ios,
                                  size: 14, color: Colors.black87)
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://st-cn.meishi.cc/p2/20230215/20230215103438_468.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
