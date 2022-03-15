import 'package:flutter/material.dart';

Alert(BuildContext context,double width , double height,ThemeData themeData) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("This item is added before"),
          content: const Text("Do you need to add it again?"),
          actions: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width*.24,
                      height: height*.045,
                      child: ElevatedButton(
                          onPressed: null,
                          child: const Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
                            backgroundColor:
                            MaterialStateProperty.all(themeData.backgroundColor),
                          )),
                    ),
                    Container(
                      width: width*.24,
                      height: height*.045,
                      child: ElevatedButton(
                          onPressed: null,
                          child: const Text(
                            'yes',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
                            backgroundColor:
                            MaterialStateProperty.all(themeData.backgroundColor),
                          )),
                    )
                  ],
                ),SizedBox(height: height*.02,)
              ],
            )

          ],
        );
      });
}
