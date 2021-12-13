import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_info.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {

    const image = "assets/products/phone2.jpg";
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: imageHandler(image),
                builder:(BuildContext context , AsyncSnapshot<AspectRatio> img){
                 return img.data!;
                }
            ),
            const SizedBox(height: 24,),
          ],
        ),
      ),
    );
  }
}
