import 'package:deliciousfood_flutter/views/recommend/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/utils.dart';

class RecommendAppbar extends StatelessWidget implements PreferredSizeWidget {
  const RecommendAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Row(
          children: [
            Image.asset(
              "resource/images/appbar_add.png",
              width: 25,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              height: 36,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(22)),
              child: TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("resource/images/appbar_search.png",
                          width: 16),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("搜索食材,食谱",
                          style: TextStyle(color: Colors.black54))
                    ],
                  )),
            )),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              child: Image.asset(
                "resource/images/appbar_menu.png",
                width: 25,
              ),
              onTap: () {
                pushToPage(context, const CategoryPage());
              },
            )
          ],
        ));
  }

  @override
  Size get preferredSize => Size(ScreenUtil().screenWidth, 44);
}
