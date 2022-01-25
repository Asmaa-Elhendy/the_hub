import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.06,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.calendar_today_outlined,
              size: 17,
              color: Colors.grey[600],
            ) ,
            onPressed: (){
              showDatePicker(
                context:context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2040),
                initialDate: _dateTime?? DateTime.now(),


              ).then((date) {

                setState(() {
                  _dateTime = date;
                });
              });

            },
          ),
          VerticalDivider(
            color: Colors.grey,
            thickness: 0.5,
          ),
          SizedBox(
            width: width * 0.03,
          ),
          _dateTime==null?Text(""):Text("${_dateTime!.day}/${_dateTime!.month}/${_dateTime!.year}",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.grey[600]
            ),
          )
        ],
      ),
    );
  }
}
