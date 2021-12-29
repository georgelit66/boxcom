import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormField extends StatefulWidget {
  const FormField({Key? key, required this.controller, required this.hint, required this.icon, required this.maxLines}) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final Icon icon;
   final int maxLines;

  @override
  _FormFieldState createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
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
            maxLines: widget.maxLines,
            controller: widget.controller,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                border: InputBorder.none,
                fillColor: Colors.black54,
                hintText: widget.hint,
                hintStyle: const TextStyle(color: Colors.black54),
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



