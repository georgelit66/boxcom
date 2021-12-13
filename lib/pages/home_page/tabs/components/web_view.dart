import 'package:boxcom/models/enterprise_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key, required this.enterprise}) : super(key: key);

  final Enterprise enterprise;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  var isLoading = true;
  late WebViewController controller;
  double progress = 0;


  @override
  Widget build(BuildContext context) {

    var url = widget.enterprise.website;
    var title = widget.enterprise.name;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
              Icons.arrow_back,
              color: Colors.black
          ),
        ),

        actions: <Widget>[

          IconButton(
              onPressed:()=>controller.reload(),
              icon: const Icon(
                  Icons.refresh,
                  color: Colors.black54,
              )
          )
        ],



        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
        ),
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
                  initialUrl: url,
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
