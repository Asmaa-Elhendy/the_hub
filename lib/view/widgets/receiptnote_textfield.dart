import 'package:flutter/material.dart';

class ReceiptNoteTextField extends StatefulWidget {
  const ReceiptNoteTextField({Key? key}) : super(key: key);

  @override
  _ReceiptNoteTextFieldState createState() => _ReceiptNoteTextFieldState();
}

class _ReceiptNoteTextFieldState extends State<ReceiptNoteTextField> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.07,
      child: TextFormField(

        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
          color: Colors.grey,
      ),

          ),
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        )

      ),
    );
  }
}
