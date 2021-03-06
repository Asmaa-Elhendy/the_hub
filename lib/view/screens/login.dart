import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_hub/controller/login_controller.dart';
import 'package:the_hub/view/screens/detect_business_location.dart';
import 'package:the_hub/view/screens/welcom_screen.dart';
import 'package:the_hub/view/widgets/alertmessage.dart';
import 'package:the_hub/view/widgets/login_textfield.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import '../widgets/button.dart';
import 'access_denied.dart';
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
              height: height-height*0.04,
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
                                  Loader.show(context,progressIndicator:LinearProgressIndicator());
                                  if (_formKey.currentState!.validate()){
                                 await    Helper.login(usernamecontroller.text,passwordcontroller.text);
                          //      Get.off(AccessDenied());
                            Helper.errormesssage=='no'?  Get.off(BusinessLocation(theme: widget.theme)):Alertmessage(context,Helper.errormesssage,widget.theme,width,height);
                                 Loader.hide();
                                  }
                                },
                                child:CustomButton(theme: widget.theme,title: 'Login',)
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
