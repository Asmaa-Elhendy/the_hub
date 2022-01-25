import 'package:flutter/material.dart';

class BusinessLocatioDropBox extends StatefulWidget {
  const BusinessLocatioDropBox({Key? key}) : super(key: key);

  @override
  _BusinessLocatioDropBoxState createState() => _BusinessLocatioDropBoxState();
}

class _BusinessLocatioDropBoxState extends State<BusinessLocatioDropBox> {
   String? initialValue;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.06,
      padding: EdgeInsets.only(left: width * 0.1),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child:
      DropdownButtonHideUnderline(

        child: DropdownButton<String>(
          hint: Text("Please Select"),
          isExpanded: true,

          icon: Container(
            margin: EdgeInsets.only(left: width * .1,

            ),
            child: Icon(Icons.arrow_drop_down_outlined),
          ),
          value:initialValue,


          onChanged: ( value){
            setState(() {
              initialValue = value!;
            });
          },
          items: items.map((String value) {
            return  DropdownMenuItem<String>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),

        ),
      ),



    );
  }
}
