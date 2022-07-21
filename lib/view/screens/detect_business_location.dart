import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_hub/view/screens/welcom_screen.dart';

import '../../controller/exper_api.dart';
import '../widgets/businesslocation_dropbox.dart';

class BusinessLocation extends StatefulWidget {
  BusinessLocation({required this.theme});
  ThemeData theme;
  @override
  State<BusinessLocation> createState() => _BusinessLocationState();
}

class _BusinessLocationState extends State<BusinessLocation> {
  TextEditingController _businessLicationController = TextEditingController();
  List<String> businessLocationsNames = [];
  String? initialValue;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  getbusinessLocationName() async {
    List<String> business_locations_names =
        await ExperApi.GetBusinessLocationsNames();
    businessLocationsNames = business_locations_names;
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    getbusinessLocationName();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                    height: height - height * 0.04,
                    color: widget.theme.backgroundColor,
                    child: Stack(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * .1,
                            left: width * .4,
                            right: width * .4),
                        child: Image.asset(
                          "assets/images/logo.png",
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                          top: height * .34,
                          child: Container(
                              width: width,
                              height: height * .6,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * .04),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: height * .05,bottom: height*.075),
                                          child: const Text(
                                            'Enter your business location',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 21,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: height * .02),
                                          child: Text(
                                            "Business location:",
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 17),
                                          ),
                                        ),
                                        BusinessLocatioDropBox(
                                          business_locations_names:
                                              businessLocationsNames,
                                          theme: widget.theme,
                                        ),
                                        // drop(width,height,businessLocationsNames),
                                        // Padding(
                                        //     padding: EdgeInsets.symmetric(
                                        //         vertical: height * .08),
                                        //     child: Center(
                                        //         child: InkWell(
                                        //             onTap: ()async{
                                        //               Get.to(Welcome());
                                        //               print('tapppped');
                                        //
                                        //             },
                                        //           child: Container(
                                        //           width: width*.6,
                                        //           height: height*.05,
                                        //           decoration: BoxDecoration(
                                        //             borderRadius: BorderRadius.circular(15),
                                        //             color: widget.theme.backgroundColor,
                                        //             boxShadow: [
                                        //               BoxShadow(
                                        //                 color: Colors.grey.withOpacity(0.5),
                                        //                 spreadRadius: 3,
                                        //                 blurRadius: 3,
                                        //                 offset: Offset(0, 3), // changes position of shadow
                                        //               ),
                                        //             ],
                                        //           ),child: const Center(child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 17),)),
                                        //         ),
                                        //             )))
                                      ]))
                          ))
                    ])))),
      ),
    );
  }
  // Widget drop(width,height,business_locations_names){
  //
  //   return Container(
  //     height: height*0.073,
  //     padding: EdgeInsets.only(left: width * 0.1),
  //     decoration: BoxDecoration(
  //
  //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //       border: Border.all(
  //
  //         color:Colors.blue,
  //         width: 0.5,
  //       ),
  //     ),
  //     child:
  //     DropdownButtonHideUnderline(
  //
  //
  //       child: DropdownButtonFormField<String>(
  //         decoration: InputDecoration(
  //           enabledBorder: InputBorder.none,
  //         ),
  //         validator: (value) => value == null
  //             ? 'Please Enter Your Business Location': null,
  //         hint: const Text("Please Select"),
  //         isExpanded: true,
  //
  //         icon: Container(
  //           margin: EdgeInsets.only(left: width * .1,
  //
  //           ),
  //           child: const Icon(Icons.arrow_drop_down_outlined),
  //         ),
  //         value:initialValue,
  //
  //
  //         onChanged: ( value){
  //           setState(() {
  //             initialValue = value!;
  //           });
  //         },
  //         items: business_locations_names.map((String value) {      //items.map((String value) {
  //           return  DropdownMenuItem<String>(
  //             value: value,
  //             child: Text(value.toString()),
  //           );
  //         }).toList(),
  //
  //       ),
  //     ),
  //
  //
  //
  //   );
  // }
}
