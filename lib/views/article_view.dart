import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ArticelView extends StatefulWidget {
  final String blogUrl;
  ArticelView({this.blogUrl});

  @override
  _ArticelViewState createState() => _ArticelViewState();
}

class _ArticelViewState extends State<ArticelView> {

  final Completer<WebViewController>_completer =
  Completer<WebViewController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Aaj ",style: TextStyle(color: Colors.red),),
            Text("Ki "),
            Text("News",
              style: TextStyle(color: Colors.blue),)
          ],
        ),
        actions: [
          Opacity(
            opacity:0,
            child:Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          )
        ],
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),
    );

  }
}
