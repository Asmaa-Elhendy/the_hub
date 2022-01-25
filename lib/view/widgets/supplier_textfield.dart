import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:the_hub/view/screens/add_new_contact.dart';

class SupplierDropbox extends StatefulWidget {
  ThemeData theme;
   SupplierDropbox({Key? key,required this.theme}) : super(key: key);

  @override
  _SupplierDropboxState createState() => _SupplierDropboxState();
}

class _SupplierDropboxState extends State<SupplierDropbox> {

  TextEditingController _supplierController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var items = [
      'pepsi',
      'Almarai',
      'juhayna ',
      'cocacola13##4',
      '12345678910',
    ];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return
      TypeAheadFormField(
        textFieldConfiguration: TextFieldConfiguration(
          controller: _supplierController,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              contentPadding:
              EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                  top: 8.0),
              isDense: true,

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),

              prefixIcon: Container(
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.grey)),
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.grey[700],
                  size: MediaQuery.of(context).size.width * 0.07,
                ),
              ),
              suffixIcon: Container(
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.grey)),
                ),
                child: IconButton(
                  icon:
                 Icon (Icons.add_circle,
                   color: widget.theme.backgroundColor,
                   size: MediaQuery.of(context).size.width * 0.05,
                 ),
                  onPressed: () {
                    Get.to(AddNewContact(theme :widget.theme));
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => AddNewContact()),
                    // );
                  },
                ),
              ),
              labelText: 'Please Select'),
        ),
        suggestionsCallback: (pattern) {
          return items.where((element) =>
              element.toLowerCase().contains(pattern.toLowerCase()));
        },
        itemBuilder: (_, String ittem) => ListTile(
          title: Text(ittem),
        ),
        onSuggestionSelected: (String val) {
          setState(() {
            this._supplierController.text = val ;
          });
        },
        getImmediateSuggestions: true,
        hideSuggestionsOnKeyboardHide: false,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please select ';
          }
        },
      );
  }
}
