import 'package:boxcom/models/enterprise_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key, required this.website}) : super(key: key);

  final String website;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  var isLoading = true;
  late WebViewController controller;
  double progress = 0;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
              Icons.arrow_back,
          ),
        ),

        actions: <Widget>[

          IconButton(
              onPressed:()=>controller.reload(),
              icon: const Icon(
                  Icons.refresh,
              )
          )
        ],




      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            color: Colors.green,
            backgroundColor: Colors.grey.withOpacity(0.5),
          ),

          Expanded(
            child: Stack(
              children: [
                WebView(
                  initialUrl: widget.website,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated:(controller){
                    this.controller = controller;
                  },
                  onProgress: (progress)=> setState(() {
                    this.progress = progress / 100;
                  }),
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}
