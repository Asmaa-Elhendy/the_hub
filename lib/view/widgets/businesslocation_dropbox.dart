import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/welcom_screen.dart';
import 'button.dart';

class BusinessLocatioDropBox extends StatefulWidget {
  List<String> business_locations_names;
  ThemeData theme;
  bool change_location;
  BusinessLocatioDropBox(
      {Key? key, required this.business_locations_names, required this.theme,this.change_location=false}) : super(key: key);

  @override
  _BusinessLocatioDropBoxState createState() => _BusinessLocatioDropBoxState();
}

class _BusinessLocatioDropBoxState extends State<BusinessLocatioDropBox> {
  String? initialValue;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height * 0.07,
          padding: EdgeInsets.only(left: width * 0.04,top: height*.015,right: width*.015),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(
              color: Colors.blue,
              width: 0.5,
            ),
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: DropdownButtonFormField<String>(
              // decoration: InputDecoration(
              //   enabledBorder: InputBorder.none,
              // ),
              decoration: const InputDecoration.collapsed(
                hintText: 'Please Select',
              ),
              validator: (value) =>
                  value == null ? 'Please Enter Your Business Location' : null,
              //hint: const Text("Please Select"),
              isExpanded: true,
              icon: Container(
                margin: EdgeInsets.only(
                  left: width * .1,
                ),
                child: const Icon(Icons.arrow_drop_down_outlined),
              ),
              value: initialValue,


              onChanged: (value) {
                setState(() {
                  initialValue = value!;
                });
              },
              items: widget.business_locations_names.map((String value) {
                //items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: height * .08),
            child: Center(
                child: InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Get.to(Welcome());
                  saveBusinessLocation();
                }
                print('tapppped');
              },
  child: widget.change_location?CustomButton(theme: widget.theme,title: 'Save',): CustomButton(theme: widget.theme,title: 'Next',)

            )))
      ],
    );
  }
  void saveBusinessLocation(){
    print("save is$initialValue");
    GetStorage().write('business_location_name', initialValue);
    isSave();
  }
  void isSave()async {
    await GetStorage.init();
    GetStorage storage =GetStorage();
    var businessLocationName = await storage.read("business_location_name");
    print("issave isss $businessLocationName");
  }
}
