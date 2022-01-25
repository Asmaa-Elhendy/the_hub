import 'package:flutter/material.dart';
import 'package:the_hub/view/widgets/new_contact_form_widgets/buttons.dart';
import 'package:the_hub/view/widgets/new_contact_form_widgets/payterm_dropbox.dart';
import 'package:the_hub/view/widgets/new_contact_form_widgets/textfield.dart';
class AdditionalNewContactData extends StatelessWidget {
   AdditionalNewContactData({Key? key,required this.theme}) : super(key: key);
   ThemeData theme;
  final taxeController = TextEditingController();
  final openingBalanceController = TextEditingController();
  final address_1Controller = TextEditingController();
   final address_2Controller = TextEditingController();



   @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    ButtonsWidgets buttonOpject =
        new ButtonsWidgets(context: context,val: false, width: width, height: height,theme: theme);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus;
        currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Add New Contact"),
            actions: [
              Icon(
                Icons.account_circle_rounded,
                size: 40,
              )
            ],
          ),
          backgroundColor: Colors.grey[200],
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.03),
            child: Column(
              children: [
                Container(
            padding: EdgeInsets.only(top: height*0.01,left: width * 0.04,right: width *  0.04),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    //offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("Tax Number",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]
                    ),
                  ),
                  AddContactTextField(
                    controller: taxeController,
                    labelTextContent: "Enter Tax Number",
                    icon: Icons.info_outlined,
                  ),
                  SizedBox(height: height * .025,),
                  Text("Opening Balance",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700]
                    ),
                  ),
                  AddContactTextField(
                    controller: openingBalanceController,
                    labelTextContent: "Enter Opening Balance ",
                    icon: Icons.money_sharp,
                  ),
                  SizedBox(height: height * .025,),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Pay Term  ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700])
                        ),

                        WidgetSpan(
                          child: Icon(Icons.announcement, size: 18,color: Colors.cyan,),
                        ),


                      ],
                    ),
                  ),
                  PayTermDropBox(),

                  SizedBox(height: height * .025,),
                ]
            )
                ),
                SizedBox(height: height * .025,),
                Container(
                  padding: EdgeInsets.only(top: height*0.01,left: width * 0.04,right: width *  0.04),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          //offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text("Address Line 1",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700]
                          ),
                        ),
                        AddContactTextField(
                          controller: address_1Controller,
                          labelTextContent: "Enter Address Line 1",
                        ),
                        SizedBox(height: height * .025,),
                        Text("Address Line 2",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700]
                          ),
                        ),
                        AddContactTextField(
                          controller: address_2Controller,
                          labelTextContent: "Enter Address Line 2",
                        ),
                        SizedBox(height: height * .03,),
                    GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      childAspectRatio: 3/1.5,
                      crossAxisCount: 2,//0.82
                      crossAxisSpacing: 6,
                      children: [

                           AddContactTextField(
                            controller: address_2Controller,
                            labelTextContent: "City",
                             icon: Icons.location_on,
                          ),
                        AddContactTextField(
                          controller: address_2Controller,
                          labelTextContent: "State",
                          icon: Icons.location_on,

                        ),
                        AddContactTextField(
                          controller: address_2Controller,
                          labelTextContent: "Country",
                          icon:
                          "assets/images/earth.png",
                        ),
                        AddContactTextField(

                          controller: address_2Controller,
                          labelTextContent: "Zip/Postal code",
                          icon: "assets/images/zip-code.png",
                        ),
                      ],
                    )
                      ]
                  )

                ),
                SizedBox(height: height * .04,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buttonOpject.backButton(),
                    buttonOpject.saveButton(),

                  ],)


              ],
            ),
          )),
    );
  }
}
