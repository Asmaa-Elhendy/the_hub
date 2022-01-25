import 'package:flutter/material.dart';

class PayTermDropBox extends StatefulWidget {
  const PayTermDropBox({Key? key}) : super(key: key);

  @override
  _PayTermDropBoxState createState() => _PayTermDropBoxState();
}

class _PayTermDropBoxState extends State<PayTermDropBox> {
  String? _selectedValue;

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4 ',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Expanded(
          child: Container(
              height: height * 0.06,

                //constraints:BoxConstraints.expand(),
              padding: EdgeInsets.only(left: width * 0.03),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            child:Center(
              child: Text(
                _selectedValue == null?"Pay Term":"$_selectedValue"
              ),
            )
             // _selectedValue == null?Center(child: Text("pay term")):Text(_selectedValue!),

          ),
        ),
        Expanded(
          child: Container(
            height: height * 0.06,
            padding: EdgeInsets.only(left: width * 0.03),


            decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(

                        isExpanded: true,
                        hint: Text("Please Select"),

                        // icon: Container(
                        //   margin: EdgeInsets.only(left: width * .2,
                        //
                        //   ),
                        //   child: Icon(Icons.arrow_drop_down_outlined),
                        // ),


                        onChanged: ( value){
                          setState(() {
                            _selectedValue = value!;
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
          ),
        )
      ],
    );




    //   Container(
    //   height: height * 0.06,
    //   width: double.infinity,
    //     //constraints:BoxConstraints.expand(),
    //   padding: EdgeInsets.only(left: width * 0.03),
    //   decoration: BoxDecoration(
    //     border: Border.all(
    //       color: Colors.grey,
    //       width: 0.5,
    //     ),
    //   ),
    //   child:   Row(
    //     children: [
    //       _selectedValue == null?Center(child: Text("pay term")):Center(child: Text(_selectedValue!)),
    //
    //       Container(
    //         child: DropdownButton<String>(
    //
    //                 isExpanded: true,
    //                 hint: Text("Please Select"),
    //
    //                 icon: Container(
    //                   margin: EdgeInsets.only(left: width * .2,
    //
    //                   ),
    //                   child: Icon(Icons.arrow_drop_down_outlined),
    //                 ),
    //
    //
    //                 onChanged: ( value){
    //                   setState(() {
    //                     _selectedValue = value!;
    //                   });
    //                 },
    //                 items: items.map((String value) {
    //                   return  DropdownMenuItem<String>(
    //                     value: value,
    //                     child: Text(value.toString()),
    //                   );
    //                 }).toList(),
    //
    //         ),
    //       ),
    //     ],
    //   )
    //
    //
    //
    //
    //
    //   // child: Row(
    //   //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   //   children: [
    //   //     Container(
    //   //       height: height * 0.06,
    //   //
    //   //       padding: EdgeInsets.only(right: width * 0.1,left: width* 0.1),
    //   //       decoration: BoxDecoration(
    //   //         border: Border(right: BorderSide(color: Colors.grey)),
    //   //       ),
    //   //       child: _selectedValue == null?Center(child: Text("pay term")):Center(child: Text(_selectedValue!)),
    //   //     ),
    //   //
    //   //   DropdownButtonHideUnderline(
    //   //
    //   //     child: DropdownButton<String>(
    //   //
    //   //       //isExpanded: true,
    //   //       hint: Text("Please Select"),
    //   //
    //   //       icon: Container(
    //   //         margin: EdgeInsets.only(left: width * .2,
    //   //
    //   //         ),
    //   //         child: Icon(Icons.arrow_drop_down_outlined),
    //   //       ),
    //   //       value:_selectedValue,
    //   //
    //   //
    //   //       onChanged: ( value){
    //   //         setState(() {
    //   //           _selectedValue = value!;
    //   //         });
    //   //       },
    //   //       items: items.map((String value) {
    //   //         return  DropdownMenuItem<String>(
    //   //           value: value,
    //   //           child: Text(value.toString()),
    //   //         );
    //   //       }).toList(),
    //   //
    //   //     ),
    //   //   ),
    //   //
    //   // ],),
    // );
  }
}
