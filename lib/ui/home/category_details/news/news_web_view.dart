import 'package:flutter/material.dart';
import 'package:news_app/ui/home/widget/main_loading_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  final String url;
  const NewsWebView({super.key,required this.url});

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url){
          setState(() {
            _isLoading=true;
          });
        },
        onPageFinished:(url) {
          setState(() {
            _isLoading=false;
          });
        },
      )
    )
    ..loadRequest(Uri.parse(widget.url));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if(_isLoading )
             const Center(
               child: MainLoadingWidget(),
             )

        ],
      ),
    );
  }
}
