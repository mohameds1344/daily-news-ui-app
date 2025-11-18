import 'package:daily_news/widgets/common_widgets.dart';
import 'package:daily_news/widgets/news_list_view_builder.dart';
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
    if (widget.URL != null && widget.URL.isNotEmpty) {
      controller =
          WebViewController()
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
    return Stack(
      children: [
        WebViewWidget(controller: controller),
        if (widget.isLoading)
          Center(child: CircularProgressIndicator(
            color: Colors.blueAccent,
            backgroundColor: Colors.grey,
          )),

        if(widget.hasError)
          Center(child: ErrorMessage(),),  
      ],
    );
  }
}
