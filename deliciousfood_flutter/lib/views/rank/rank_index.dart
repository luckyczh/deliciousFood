import 'package:flutter/material.dart';

class RankIndexWidget extends StatefulWidget {
  const RankIndexWidget({super.key});

  @override
  State<RankIndexWidget> createState() => _RankIndexWidgetState();
}

class _RankIndexWidgetState extends State<RankIndexWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("rank"),
    );
  }
}
