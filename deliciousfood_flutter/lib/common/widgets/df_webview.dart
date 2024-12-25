import 'package:deliciousfood_flutter/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DFWebView extends StatefulWidget {
  final String url;
  final String? title;
  const DFWebView({super.key, required this.url, this.title});

  @override
  State<DFWebView> createState() => _DFWebViewState();
}

class _DFWebViewState extends State<DFWebView> {
  late WebViewController _controller;
  bool loadFinish = false;
  String title = "";
  @override
  void initState() {
    _controller = WebViewController();
    _controller
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          _controller.getTitle().then((value) {
            title = value ?? widget.title ?? "";
            loadFinish = true;
            setState(() {});
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: loadFinish
            ? WebViewWidget(controller: _controller)
            : loadingWidget());
  }
}
