import 'package:deliciousfood_flutter/common/app_routes.dart';
import 'package:deliciousfood_flutter/pages/tab_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, chil) {
        return MaterialApp(
          builder: FToastBuilder(),
          title: '食物杰',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.white,
              useMaterial3: true,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              appBarTheme: const AppBarTheme(
                color: Colors.white,
              )),
          routes: routes,
        );
      },
    );
  }
}
