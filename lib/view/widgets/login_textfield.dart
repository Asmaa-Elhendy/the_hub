import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  String label;
  TextEditingController controller;
  LoginTextField({required this.label,required this.controller});

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool isShow=false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.label=='password'?isShow?false:true:false,
      controller: widget.controller ,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the ${widget.label}';
        }
        return null;
      },
      decoration: InputDecoration(

          prefixIcon: widget.label=="username"?Icon(Icons.person):Icon(Icons.lock),
          suffixIcon: widget.label=='password'?IconButton(onPressed: (){
            setState(() {
              isShow=!isShow;
            });
          }, icon: Icon(isShow?Icons.remove_red_eye_outlined:Icons.remove_red_eye)):null,
          hintText: widget.label=="username"?"Enter your username":"Enter your password",
          contentPadding: EdgeInsets.all(MediaQuery.of(context).size.height*.01),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
      ),
    );
  }
}