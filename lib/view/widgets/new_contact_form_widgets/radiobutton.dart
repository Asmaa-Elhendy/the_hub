import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
   RadioButtonWidget({Key? key,required this.themeData}) : super(key: key);
  ThemeData themeData;

  @override
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: _value,
              onChanged: (int ?value){
                setState(() {
                  _value = value!;

                });

              },activeColor: widget.themeData.backgroundColor,
            ),
            Text('Individual',
              style: TextStyle(
                  fontSize: width*0.035,
                  fontWeight: FontWeight.normal
              ),

            ),

          ],

        ),
        Row(
          children: [
            Radio(
              value: 2,
              groupValue: _value,
              onChanged: (int ?value){
                setState(() {
                  _value = value!;
                });
              },activeColor: widget.themeData.backgroundColor,
            ),
            Text('Third Party',
              style: TextStyle(
                fontSize: width*0.035,
                fontWeight: FontWeight.normal
              ),

            ),

          ],

        ),
      ],
    );
  }
}
