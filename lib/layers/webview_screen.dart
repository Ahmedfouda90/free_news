import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewScreren extends StatelessWidget {
  const WebViewScreren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WebViewWidget(
            controller: WebViewController(

            ),
            layoutDirection:TextDirection.rtl ,

          ),
        ],
      ),
    );
  }
}
