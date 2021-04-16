import 'package:flutter/material.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDetails extends StatefulWidget {
  final String url;
  WebViewDetails(this.url);
  @override
  _WebViewDetailsState createState() => _WebViewDetailsState(url);
}

class _WebViewDetailsState extends State<WebViewDetails> {
  final String url;
  final _key = UniqueKey();
  _WebViewDetailsState(this.url);

  Color backgroundColor = Colors.purple[900];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Container(
          child: subCommonAppBar(context, 60),
        ),
        Expanded(
            child: WebView(
                key: _key,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: url))
      ],
    )));
  }
}
