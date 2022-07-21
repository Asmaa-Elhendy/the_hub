import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccessDenied extends StatelessWidget {
  const AccessDenied({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('You don\'t have access',style: TextStyle(fontWeight: FontWeight.bold,fontSize: width*.07),),),
     Center(child:  Image.asset('assets/images/no-stopping.png',width: width*.4,height: height*.3,),)
        ],
      ),
    );
  }
}
