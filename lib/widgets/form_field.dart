import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myFormField(BuildContext context, String hint,Icon icon, TextEditingController controller) {
  return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 15,
            offset: const Offset(5, 5),
          )
        ],
      ),
      child:  TextField(

          controller: controller,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.black54),


              prefixIcon:  SizedBox(
                  width: 50,
                  child: Align(
                      alignment: Alignment.center,
                      child: icon
                  )
              )
          )
      )
  );
}
