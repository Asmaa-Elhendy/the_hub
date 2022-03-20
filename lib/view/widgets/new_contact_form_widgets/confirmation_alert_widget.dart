import 'package:flutter/material.dart';
import 'package:the_hub/controller/supplier_controller.dart';
import 'package:the_hub/view/screens/good_receipt_note_screens.dart';

Alert(BuildContext context, double width, double height,{
  String? mobile,
  String? name,
  String? alternateContactNumber,
  String? landLiner,
  String? email,
  String? shippingAddress,
  String? tax,
  String? openingBalance,
  String? address_1,
  String? address_2,
  String?city,
  String?state,
  String?country,
  String?zip_Or_postal,
  String?pay_term_type}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you Sure you Want To Add This Supplier"),
          actions: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width * .24,
                      height: height * .045,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35))),
                            backgroundColor: MaterialStateProperty.all(
                                ThemeData().primaryColor),
                          )),
                    ),
                    Container(
                      width: width * .24,
                      height: height * .045,
                      child: ElevatedButton(
                          onPressed: () {
                            SupplierHelper.addSupplier(
                                zip_Or_postal: zip_Or_postal,
                                state: state,
                                country: country,
                                city: city,
                                email: email,
                                mobile: mobile,
                                address1: address_1,
                                address2: address_2,
                                alternate_number: alternateContactNumber,
                                landline: landLiner,
                                opening_balance: openingBalance,
                                pay_term: pay_term_type,
                                shipping_address: shippingAddress,
                                tax_number: tax,
                                name: name,
                            );
                            //Navigator.of(context).pop();
                            //SupplierHelper.getSupplier();
                            Navigator.pushAndRemoveUntil(
                                context, MaterialPageRoute(builder: (BuildContext context) => GoodReceiptNote()),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35))),
                            backgroundColor: MaterialStateProperty.all(
                                ThemeData().primaryColor),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .02,
                )
              ],
            )
          ],
        );
      });
}
