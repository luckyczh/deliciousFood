import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalWheel extends StatefulWidget {
  final List<String> items;
  final int selectedIndex;

  const HorizontalWheel({Key? key, required this.items, this.selectedIndex = 0})
      : super(key: key);

  @override
  State<HorizontalWheel> createState() => _HorizontalWheelState();
}

class _HorizontalWheelState extends State<HorizontalWheel> {
  late ScrollController _scrollController;
  int _selectedIndex = 0;
  late int _virtualItemCount = 1000; // 虚拟项数量，用于模拟无限滚动
  final _itemWidth = 70.0; // 每个项的宽度
  final _selectedItemWidth = 120.0; // 选中项的宽度

  @override
  void initState() {
    super.initState();
    _virtualItemCount = widget.items.length * 5;
    _selectedIndex = widget.selectedIndex;
    _scrollController = ScrollController(
        initialScrollOffset:
            (widget.items.length * 2 + _selectedIndex) * _itemWidth -
                ScreenUtil().screenWidth / 2 +
                _itemWidth / 2);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final count = widget.items.length;
    final disntance = ScreenUtil().screenWidth / 2 - (_itemWidth / 2);
    final maxOffset = (count * 3) * _itemWidth - disntance;
    final minOffset = count * _itemWidth - disntance;
    final initialOffset = (count * 2) * _itemWidth - disntance;
    if (offset == maxOffset || offset == minOffset) {
      _scrollController.jumpTo(initialOffset);
    }
    setState(() {});
  }

  double _calculateScale(int index) {
    final centerOffset =
        _scrollController.offset + (MediaQuery.of(context).size.width / 2);
    final distanceFromCenter =
        (index * _itemWidth + (_itemWidth / 2) - centerOffset).abs();
    const maxDistance = 200;
    final percent = (1 - distanceFromCenter / maxDistance).clamp(0.5, 1) + 0.3;
    return percent;
  }

  void _scrollToCenter(int index) {
    final targetOffset =
        index * _itemWidth - (ScreenUtil().screenWidth / 2) + (_itemWidth / 2);
    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: _virtualItemCount,
        itemBuilder: (context, index) {
          final realIndex = index % widget.items.length;
          final scale = 1.0; //_calculateScale(index);
          final isSelected = _selectedIndex == realIndex;
          return GestureDetector(
            onTap: () {
              _selectedIndex = realIndex;
              _scrollToCenter(index);
            },
            child: Container(
                width: _itemWidth,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  isSelected
                      ? '今日${widget.items[realIndex]}'
                      : widget.items[realIndex],
                  style: TextStyle(
                    fontSize: 18 * scale,
                    fontWeight: FontWeight.w900,
                  ),
                )),
          );
        },
      ),
    );
  }
}
