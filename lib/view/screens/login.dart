import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_hub/controller/login_controller.dart';
import 'package:the_hub/view/widgets/alertmessage.dart';
import 'package:the_hub/view/widgets/login_textfield.dart';

import 'good_receipt_note_screens.dart';

class Login extends StatefulWidget {
   Login({required this.theme});
  ThemeData theme;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 final usernamecontroller=TextEditingController();

   final passwordcontroller=TextEditingController();

 final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus;
          currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: widget.theme.backgroundColor,
          body: SingleChildScrollView(
            child: Container(
              width: width,
              height: height-height*.04, //*****************
              color: widget.theme.backgroundColor,
              child: Stack(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: height*.1,left: width*.4,right: width*.4),
                    child: Image.asset("assets/images/logo.png",color: Colors.white,),
                  ),
                  Positioned(
                    top: height*.34,
                    child: Container(
                      width: width,
                      height: height*.6,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25))
                      ),child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*.04),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Form(
                           key: _formKey,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(
                                 padding:  EdgeInsets.symmetric(vertical: height*.05),
                                 child: const Text('Welcome Back',style:  TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.w600),),
                               ),
                               Padding(
                                 padding: EdgeInsets.only(bottom: height*.02),
                                 child: Text("UserName",style: TextStyle(color: Colors.grey[600],fontSize: 17),),
                               ),
                               LoginTextField(label: 'username',controller: usernamecontroller,),
                               Padding(
                                 padding: EdgeInsets.symmetric(vertical: height*.02),
                                 child: Text("Password",style: TextStyle(color: Colors.grey[600],fontSize: 17),),
                               ),
                               LoginTextField(label: "password",controller: passwordcontroller,),
                             ],
                           )
                         ),
                          Padding(
                            padding:EdgeInsets.symmetric(vertical: height*.04),
                            child: Center(
                              child: InkWell(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()){
                                 await    Helper.login(usernamecontroller.text,passwordcontroller.text);
                              Helper.errormesssage=='no'?  Get.off(GoodReceiptNote()):Alertmessage(context,Helper.errormesssage,widget.theme,width,height);
                                  }
                                },
                                child: Container(
                                  width: width*.6,
                                  height: height*.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: widget.theme.backgroundColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),child: const Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 17),)),
                                ),
                              ),
                            ),
                          )
                        ],
                    ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
