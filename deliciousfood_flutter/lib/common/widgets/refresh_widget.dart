import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshPageController extends RefreshController {
  int page = 0;
}

typedef RefreshCallback = void Function(RefreshPageController controller);

class RefreshWidget extends StatefulWidget {
  final Widget child;
  final RefreshCallback? onLoading;
  final RefreshCallback? onRefresh;
  const RefreshWidget({
    super.key,
    required this.child,
    this.onLoading,
    this.onRefresh,
  });

  @override
  State<RefreshWidget> createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  final RefreshPageController _controller = RefreshPageController();
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _controller,
      enablePullDown: widget.onRefresh != null,
      enablePullUp: widget.onLoading != null,
      onLoading: _loading,
      onRefresh: _refreshing,
      header: const WaterDropHeader(),
      footer: const ClassicFooter(),
      child: widget.child,
    );
  }

  _loading() {
    if (widget.onLoading != null) {
      _controller.page += 1;
      widget.onLoading!(_controller);
    }
  }

  _refreshing() {
    if (widget.onRefresh != null) {
      _controller.page = 1;
      widget.onRefresh!(_controller);
    }
  }
}
