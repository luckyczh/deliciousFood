import 'package:flutter/material.dart';

class MineIndexWidget extends StatefulWidget {
  const MineIndexWidget({super.key});

  @override
  State<MineIndexWidget> createState() => _MineIndexWidgetState();
}

class _MineIndexWidgetState extends State<MineIndexWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("mine"),
    );
  }
}
