import 'package:deliciousfood_flutter/common/network/base/client.dart';
import 'package:deliciousfood_flutter/common/network/extension/home_client.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../models/mine/person_model.dart';
import 'mine_index_header.dart';

class MineIndexWidget extends StatefulWidget {
  const MineIndexWidget({super.key});

  @override
  State<MineIndexWidget> createState() => _MineIndexWidgetState();
}

class _MineIndexWidgetState extends State<MineIndexWidget>
    with AutomaticKeepAliveClientMixin {
  PersonModel? model;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return model == null
        ? const SizedBox()
        : VisibilityDetector(
            key: const Key('mine-widget-key'),
            child: CustomScrollView(
              slivers: <Widget>[_topWidget()],
            ),
            onVisibilityChanged: (info) {
              if (info.visibleFraction == 1) {
                _getPersonInfo();
              }
            },
          );
  }

  @override
  void initState() {
    _getPersonInfo();
    super.initState();
  }

  void _getPersonInfo() async {
    model = await client.getUerInfo();
    setState(() {});
  }

  Widget _topWidget() {
    return SliverToBoxAdapter(
      child: MineIndexHeader(
        model: model!,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MyPainter extends CustomPainter {
  final List<Color> colors;

  MyPainter(this.colors);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = colors.first
      ..style = PaintingStyle.fill;
    final centerX = size.width / 2.0;
    // var path = Path();
    // path.moveTo(centerX - 3, 0);
    // path.quadraticBezierTo(centerX, -5, centerX + 3, 0);
    // path.lineTo(centerX + 75, 150);
    // path.quadraticBezierTo(centerX + 76, 154, centerX + 72, 154);
    // path.lineTo(centerX - 72, 154);
    // path.quadraticBezierTo(centerX - 76, 154, centerX - 75, 150);
    // path.close();
    // canvas.drawPath(path, paint);
    paint.color = Colors.pink;
    var topPath = Path();
    topPath.moveTo(centerX - 3, 0);
    topPath.quadraticBezierTo(centerX, -5, centerX + 3, 0);
    topPath.lineTo(centerX + 25, 45);
    topPath.lineTo(centerX - 25, 45);
    topPath.close();
    canvas.drawPath(topPath, paint);

    paint.color = colors[1];
    var middlePath = Path();
    middlePath.moveTo(centerX - 27, 50);
    middlePath.lineTo(centerX + 27, 50);
    middlePath.lineTo(centerX + 49, 95);
    middlePath.lineTo(centerX - 49, 95);
    middlePath.close();
    canvas.drawPath(middlePath, paint);

    paint.color = colors[2];
    var bottomPath = Path();
    bottomPath.moveTo(centerX - 51, 100);
    bottomPath.lineTo(centerX + 51, 100);
    bottomPath.lineTo(centerX + 75, 150);
    bottomPath.quadraticBezierTo(centerX + 76, 154, centerX + 72, 154);
    bottomPath.lineTo(centerX - 72, 154);
    bottomPath.quadraticBezierTo(centerX - 76, 154, centerX - 75, 150);
    bottomPath.close();
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}
