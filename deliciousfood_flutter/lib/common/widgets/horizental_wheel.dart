import 'package:flutter/material.dart';

class HorizontalWheel extends StatefulWidget {
  final List<String> items;

  const HorizontalWheel({Key? key, required this.items}) : super(key: key);

  @override
  State<HorizontalWheel> createState() => _HorizontalWheelState();
}

class _HorizontalWheelState extends State<HorizontalWheel> {
  late ScrollController _scrollController;
  int _selectedIndex = 0;
  final int _virtualItemCount = 1000; // 虚拟项数量，用于模拟无限滚动
  final _itemWidth = 80.0; // 每个项的宽度

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
        initialScrollOffset:
            0 // (_virtualItemCount / 2).floor() * 100.0 - 50.0,
        );
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // final centerOffset =
    // _scrollController.offset + (MediaQuery.of(context).size.width / 2);
    // _selectedIndex = (centerOffset / _itemWidth).round() % widget.items.length;
    setState(() {});
  }

  double _calculateScale(int index) {
    final centerOffset =
        _scrollController.offset + (MediaQuery.of(context).size.width / 2);
    final distanceFromCenter =
        (index * _itemWidth + (120 / 2) - centerOffset).abs();
    const maxDistance = 80.0;
    final scale = 1 - (distanceFromCenter / maxDistance).clamp(0.0, 1.0) * 0.1;
    return scale;
  }

  void _scrollToCenter(int index) {
    final targetOffset = index * _itemWidth -
        (MediaQuery.of(context).size.width / 2) +
        (120 / 2);
    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final realIndex = index; //index % widget.items.length;
          final scale = _calculateScale(index);
          final isSelected = realIndex == _selectedIndex;
          return GestureDetector(
              onTap: () {
                _selectedIndex = realIndex;
                _scrollToCenter(index);
                // setState(() {});
              },
              child: Transform.scale(
                scale: scale,
                child: Container(
                    width: isSelected ? 120 : _itemWidth,
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   color: isSelected ? Colors.blue : Colors.grey[200],
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    child: Text(
                      isSelected
                          ? '今日${widget.items[realIndex]}'
                          : widget.items[realIndex],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    )),
              ));
        },
      ),
    );
  }
}
