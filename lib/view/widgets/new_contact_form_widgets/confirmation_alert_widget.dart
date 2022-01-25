import 'package:flutter/material.dart';

Alert(BuildContext context, double width, double height) {
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
                            Navigator.of(context).pop();
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
