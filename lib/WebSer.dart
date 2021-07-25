import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebUse extends StatefulWidget {
  const WebUse({Key? key}) : super(key: key);

  @override
  _WebUseState createState() => _WebUseState();
}

class _WebUseState extends State<WebUse> {
  late WebViewController _controller;
  //final flutterWebviewPlugin = new FlutterWebviewPlugin();
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  Future<bool> _onWillPop() async {
    if( await _controller.canGoBack()){
      _controller.goBack();
    return false;
    }else{
      return (await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit an App'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text('Yes'),
            ),
          ],
        ),
      )) ?? false; // this will pop the widget
    }
  }
  @override
  Widget build(BuildContext context) {
    const color = const Color(0xff64c2ff);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: WebView(
            initialUrl: 'https://bukin.in/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewcontroller){
              _controller=webviewcontroller;
            },
          ),
        ),
      ),
    );
  }
}
