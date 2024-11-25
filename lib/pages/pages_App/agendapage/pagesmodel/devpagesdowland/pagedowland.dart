import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Pagedowland extends StatefulWidget {
  final String classname;
  const Pagedowland({required this.classname, super.key});

  @override
  State<Pagedowland> createState() => _PagedowlandState();
}

class _PagedowlandState extends State<Pagedowland> {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(
        Uri.parse('https://e-planner.somee.com/accueil_grp.aspx?grp=${widget.classname}'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page ${widget.classname}'),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}