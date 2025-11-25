import 'package:daily_news/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  final String URL;
  ArticleWebView({super.key, required this.URL});

  bool isLoading = true;
  bool hasError = false;

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    if (widget.URL.isNotEmpty) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {
              setState(() {
                widget.isLoading = true;
                widget.hasError = false;
              });
            },
            onPageFinished: (String url) {
              setState(() {
                widget.isLoading = false;
              });
            },
            onWebResourceError: (WebResourceError error) {
              setState(() {
                widget.isLoading = false;
                widget.hasError = true;
              });
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.URL));
    } else {
      controller = WebViewController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade100,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade100,
              child: IconButton(
                onPressed: () {
                  showFeatureMessage(context);
                },
                icon: Icon(Icons.bookmark_border, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade100,
              child: IconButton(
                onPressed: () {
                  showFeatureMessage(context);
                },
                icon: Icon(Icons.share, color: Colors.black),
              ),
            ),
          ),
        ],
      ),

      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (widget.isLoading)
            Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
                backgroundColor: Colors.grey,
              ),
            ),

          if (widget.hasError) Center(child: ErrorMessage()),
        ],
      ),
    );
  }
}
