import 'package:flutter/material.dart';

class EatIndexWidget extends StatefulWidget {
  const EatIndexWidget({super.key});

  @override
  State<EatIndexWidget> createState() => _EatIndexWidgetState();
}

class _EatIndexWidgetState extends State<EatIndexWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("eat"),
    );
  }
}
