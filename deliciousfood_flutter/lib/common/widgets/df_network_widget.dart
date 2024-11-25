import 'package:deliciousfood_flutter/common/utils/utils.dart';
import 'package:flutter/material.dart';

class NetWorkWidget<T> extends StatefulWidget {
  final Future<Object?> future;
  final AsyncWidgetBuilder<T> builder;

  const NetWorkWidget({super.key, required this.future, required this.builder});

  @override
  State<NetWorkWidget> createState() => _NetWorkWidgetState();
}

class _NetWorkWidgetState extends State<NetWorkWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingWidget();
        }
        if (snapshot.connectionState == ConnectionState.none) {
          return const Center(
            child: Text("no data"),
          );
        }
        if (snapshot.hasError) {
          return Text(snapshot.error?.toString() ?? "");
        }
        return widget.builder(context, snapshot);
      },
      future: widget.future,
    );
  }
}
