import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  ThemeData theme;
  String title="";
  CustomButton({required this.theme,required this.title});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  Container(
      width: width*.6,
      height: height*.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: theme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),child:  Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: 17),)),
    );
  }
}
