import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class PurchaseOrderTextField extends StatefulWidget {
  const PurchaseOrderTextField({Key? key}) : super(key: key);

  @override
  _PurchaseOrderTextFieldState createState() => _PurchaseOrderTextFieldState();
}

class _PurchaseOrderTextFieldState extends State<PurchaseOrderTextField> {
  var purchaseOrder = [
    '118/454455',
    '#123456',
    '1111111 ',
    '12245*',
    '1254#44444444444444',
  ];
  TextEditingController purchaseOrderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: purchaseOrderController,
        //maxLines: null,
        // style: TextStyle(
        //   fontSize: MediaQuery.of(context).size.height*.03
        // ),
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

            ),
      ),
      suggestionsCallback: (pattern) {
        return purchaseOrder.where((element) =>
            element.toLowerCase().contains(pattern.toLowerCase()));
      },
      itemBuilder: (_, String ittem) =>
          ListTile(
            title: Text(ittem),
          ),
      onSuggestionSelected: (String val) {
        setState(() {
          this.purchaseOrderController.text = val;
        });
      },
      getImmediateSuggestions: true,
      hideSuggestionsOnKeyboardHide: false,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Please Enter Data';
      //   }
      // },
    );
  }

}
