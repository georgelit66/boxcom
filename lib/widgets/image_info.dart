import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

Future<Size> imageInfo(String img) async {
  var image = await rootBundle.load(img);
  var decode = await decodeImageFromList(image.buffer.asUint8List());
  var width = decode.width;
  var height = decode.height;

  var size = Size(width.toDouble(), height.toDouble());

  return size;
}


Future<AspectRatio> imageHandler(String img) async {
  var image = await rootBundle.load(img);
  var decode = await decodeImageFromList(image.buffer.asUint8List());
  var width = decode.width;
  var height = decode.height;
  var size = Size(width.toDouble(), height.toDouble());


  if(size.height > size.width && size.height - size.width >= 300){
    return AspectRatio(
      aspectRatio: 4/6,
      child: Image(
          image: AssetImage(
            img
          )
      ),
    );
  }
  else if(size.height > size.width && size.height - size.width > 400){

    return AspectRatio(
      aspectRatio: 5/6,
      child: Image(
          image: AssetImage(
              img
          )
      ),
    );
  }

  else if(size.height > size.width && size.height - size.width  > 200){

    return AspectRatio(
      aspectRatio: 6/6,
      child: Image(
          image: AssetImage(
              img
          )
      ),
    );
  }

  else if(size.width > size.height && size.width - size.height > 200){

    return AspectRatio(
      aspectRatio: 6/5,
      child: Image(
          image: AssetImage(
              img
          )
      ),
    );
  }

  else if(size.width > size.height && size.width - size.height > 400){

    return AspectRatio(
      aspectRatio: 7/5,
      child: Image(
          image: AssetImage(
              img
          )
      ),
    );
  }


  else if(size.width > size.height && size.width - size.height > 600){

    return AspectRatio(
      aspectRatio: 4/3,
      child: Image(
          image: AssetImage(
              img
          )
      ),
    );
  }

  else {

    return AspectRatio(
      aspectRatio: 1,
      child: Image(
          image: AssetImage(
              img
          )
      ),
    );
  }

}