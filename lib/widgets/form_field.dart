import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFormField extends StatefulWidget {
  const MyFormField({Key? key, required this.controller, required this.hint, required this.icon, required this.maxLines}) : super(key: key);
  
  final String hint;
  final Icon icon;
  final TextEditingController controller;
   final int maxLines;

  @override
  _MyFormFieldState createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  @override
  Widget build(BuildContext context) {
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
          style: const TextStyle(color: Colors.black54),
            maxLines: widget.maxLines,
            controller: widget.controller,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.black54),
                hintText: widget.hint,
                hoverColor: Colors.black54,
                prefixIcon:  SizedBox(
                    width: 50,
                    child: Align(
                        alignment: Alignment.center,
                        child: widget.icon
                    )
                )
            )
        )
    );
  }
}



