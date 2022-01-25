import'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


class Auto extends StatefulWidget {
  const Auto({Key? key}) : super(key: key);

  @override
  State<Auto> createState() => _AutoState();
}

class _AutoState extends State<Auto> {
  TextEditingController textcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: textcontroller,
              autofocus: true,
              textAlignVertical: TextAlignVertical.center,
              style:  TextStyle(overflow: TextOverflow.visible,fontSize: width*.045),
              decoration:InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: "Enter Product Name/SKU/Scan bar code",
                hintStyle: TextStyle(color: Colors.grey,fontSize: width*.032),
                //  contentPadding: EdgeInsets.all(5),
                suffixIcon: InkWell(
                  onTap: ()async{
                    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                        "#ff6666",
                        "CANCEL",
                        false,
                        ScanMode.BARCODE);
                    if(!mounted) return;
                    setState(() {
                      var value= barcodeScanRes;
                      print("asmaa ${value}");
                    });
                  },
                  child: Image.asset("assets/images/barcodenew.png",),
                ),
              ),
          ),
          suggestionsCallback: (pattern) async {
            return await CitiesService.getSuggestions(pattern);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(suggestion.toString()),
            );
          },
          onSuggestionSelected: (suggestion) {
               setState(() {
                 textcontroller.text=suggestion.toString();
               });
          },
        ),
      ),
    );
  }
}

class CitiesService {
  static final List<String> cities = [
    'Beirut',
    'Damascus',
    'San Fransisco',
    'Rome',
    'Los Angeles',
    'Madrid',
    'Bali',
    'Barcelona',
    'Paris',
    'Bucharest',
    'New York City',
    'Philadelphia',
    'Sydney',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(cities);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

}