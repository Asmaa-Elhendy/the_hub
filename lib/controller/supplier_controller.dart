import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:the_hub/model/supplier_model.dart';

class SupplierHelper{
  static String url = "http://svpos.smartqr.app/connector/api/contactapi";
  // static List<Supplier> suppliers = [
  //
  // ];
  // static List suppliers = [
  //
  // ];

  static Future getSupplier()async{
    List suppliers =[];


   GetStorage storage =GetStorage();
   var token = await storage.read("token");
    String bizname = await getBusinessname();
    var response = await http.get(Uri.parse("http://svpos.smartqr.app/connector/api/contactapi?type=supplier&biz_name=$bizname&per_page=-1"),

      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
        //eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImIyNzJjOTFiNjQxY2Q5MzQxMDZkZWU0ODBkNmU4ZWM2MTI4MWViYzNjNTc0NGI1YWZjYmU4YjZjYmRkOTg5OWNlYzMwZmUwY2IwYmM3ZmVmIn0.eyJhdWQiOiIxNCIsImp0aSI6ImIyNzJjOTFiNjQxY2Q5MzQxMDZkZWU0ODBkNmU4ZWM2MTI4MWViYzNjNTc0NGI1YWZjYmU4YjZjYmRkOTg5OWNlYzMwZmUwY2IwYmM3ZmVmIiwiaWF0IjoxNjQ2NDk0Mjk1LCJuYmYiOjE2NDY0OTQyOTUsImV4cCI6MTY3ODAzMDI5NSwic3ViIjoiMSIsInNjb3BlcyI6W119.CUa33_2tY93zzlbPXkl0AEKQ2b1LqPSlp0RCmraNGU4EUFY-ufgcVVhDqtTlQc069dxEvTivQYRJk_HwNotz_PPmmc7xG-IutSuI1lRjztP4QVZFlR1WdmGohYMOeLr6FvOcX6kfnPGdeDZZCrc3d_glyzvHiLGnCT4hEqRUmNUjWnChGZ13AjAAM-hk8YwWJ8pUkEcu3lhCXRzXrkDgPDKs3BH4pq2mgLQNjV17-tFmjllS-5o5wF87uGue8JIjeWpTMR6wx0eXjthJ44ZrohbonT9WD3HnBsq6jlRUFslHQH0S7Zg0ME7KI1HTVrq9EjTQu_nQHP8Nn3L9EFzlcXS8nlu1cg1Sih7GA6e5H7w0fzmSj91by-UOL22XBeooREmFFzrvIyuxZn9CNoNHgnEkCZCAU5Z4vna68HPfDTvhyGGwvu41g2GoXov5fAghYnbF28v0UOLJlQKm764xd9ja7LmGHRN_nZoWR3ARZeHK9K5sYAQiBUtiEo-bZjsqxlueOds1vutJh5nsdfePKJYF6-5-rTC8o0GJCmVr05gDKZKBS1MKsQU4hbvP04fiaHXZFmPeX3mNhQIoU-5AfW673E2QYzKNu_RYFyvQ3YSIEs4DJHJOS_T5Jdv96lBpg5QlnXo1wepoNj9IzN3N59pmT_2MPefqeym2WvwWhpo
            //"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImIyNzJjOTFiNjQxY2Q5MzQxMDZkZWU0ODBkNmU4ZWM2MTI4MWViYzNjNTc0NGI1YWZjYmU4YjZjYmRkOTg5OWNlYzMwZmUwY2IwYmM3ZmVmIn0.eyJhdWQiOiIxNCIsImp0aSI6ImIyNzJjOTFiNjQxY2Q5MzQxMDZkZWU0ODBkNmU4ZWM2MTI4MWViYzNjNTc0NGI1YWZjYmU4YjZjYmRkOTg5OWNlYzMwZmUwY2IwYmM3ZmVmIiwiaWF0IjoxNjQ2NDk0Mjk1LCJuYmYiOjE2NDY0OTQyOTUsImV4cCI6MTY3ODAzMDI5NSwic3ViIjoiMSIsInNjb3BlcyI6W119.CUa33_2tY93zzlbPXkl0AEKQ2b1LqPSlp0RCmraNGU4EUFY-ufgcVVhDqtTlQc069dxEvTivQYRJk_HwNotz_PPmmc7xG-IutSuI1lRjztP4QVZFlR1WdmGohYMOeLr6FvOcX6kfnPGdeDZZCrc3d_glyzvHiLGnCT4hEqRUmNUjWnChGZ13AjAAM-hk8YwWJ8pUkEcu3lhCXRzXrkDgPDKs3BH4pq2mgLQNjV17-tFmjllS-5o5wF87uGue8JIjeWpTMR6wx0eXjthJ44ZrohbonT9WD3HnBsq6jlRUFslHQH0S7Zg0ME7KI1HTVrq9EjTQu_nQHP8Nn3L9EFzlcXS8nlu1cg1Sih7GA6e5H7w0fzmSj91by-UOL22XBeooREmFFzrvIyuxZn9CNoNHgnEkCZCAU5Z4vna68HPfDTvhyGGwvu41g2GoXov5fAghYnbF28v0UOLJlQKm764xd9ja7LmGHRN_nZoWR3ARZeHK9K5sYAQiBUtiEo-bZjsqxlueOds1vutJh5nsdfePKJYF6-5-rTC8o0GJCmVr05gDKZKBS1MKsQU4hbvP04fiaHXZFmPeX3mNhQIoU-5AfW673E2QYzKNu_RYFyvQ3YSIEs4DJHJOS_T5Jdv96lBpg5QlnXo1wepoNj9IzN3N59pmT_2MPefqeym2WvwWhpo",
      },

    );
    var responseBody =jsonDecode(response.body);
    print("get suppliers response is${response.statusCode}");

    if(response.statusCode==200){
      for(int i=0;i<responseBody["data"].length;i++){
        String name;
        // if(responseBody["data"][i]["supplier_business_name"]!=null){
        //   name = responseBody["data"][i]["supplier_business_name"];
        // }else{
        //   name = responseBody["data"][i]["name"];
        // }
        //if(responseBody["data"][i]["type"]=="supplier"){
        //   suppliers.add(
        //       Supplier(
        //           id: responseBody["data"][i]["id"],
        //           name:responseBody["data"][i]["name"],
        //           business_id: responseBody["data"][i]["business_id"]));
        suppliers.add(responseBody["data"][i]["name"],);
       // }else{

        //}


        //print(suppliers[i].name);

      }
      print("supp in controller is $suppliers");


    }
    //return responseBody;
    return suppliers;
  }

   static Future<String> getBusinessname() async{
    var url="http://svpos.smartqr.app/connector/api/user/loggedin";
    String biz_name;
    GetStorage storage =GetStorage();
    var token = await storage.read("token");
    var response = await http.get(Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      }

    );
    var responsbody = json.decode(response.body);
    biz_name = responsbody["data"]["business"]["name"];
    print("bizname $biz_name");
    return biz_name;



  }

  static Future addSupplier({mobile,name, alternate_number,landline,email,shipping_address,tax_number,opening_balance,pay_term,address1,address2,city,state,country,zip_Or_postal})async{
    String bizname = await getBusinessname();
    final  msg = jsonEncode({
     "type":"supplier",
      "first_name":name,
      "supplier_business_name": bizname,
      "name": name,
      "mobile":mobile,
      "landline": landline,
      "alternate_number": alternate_number,
      "address_line_1": address1,
      "address_line_2": address2,
      "city": city,
      "state": state,
      "country": country,
      "zip_code": zip_Or_postal,
      "shipping_address":shipping_address,
     "opening_balance":opening_balance,
      "email":email,
     "pay_term_type":pay_term

   });
    var response = await http.post(Uri.parse("http://svpos.smartqr.app/connector/api/contactapi"),


      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImIyNzJjOTFiNjQxY2Q5MzQxMDZkZWU0ODBkNmU4ZWM2MTI4MWViYzNjNTc0NGI1YWZjYmU4YjZjYmRkOTg5OWNlYzMwZmUwY2IwYmM3ZmVmIn0.eyJhdWQiOiIxNCIsImp0aSI6ImIyNzJjOTFiNjQxY2Q5MzQxMDZkZWU0ODBkNmU4ZWM2MTI4MWViYzNjNTc0NGI1YWZjYmU4YjZjYmRkOTg5OWNlYzMwZmUwY2IwYmM3ZmVmIiwiaWF0IjoxNjQ2NDk0Mjk1LCJuYmYiOjE2NDY0OTQyOTUsImV4cCI6MTY3ODAzMDI5NSwic3ViIjoiMSIsInNjb3BlcyI6W119.CUa33_2tY93zzlbPXkl0AEKQ2b1LqPSlp0RCmraNGU4EUFY-ufgcVVhDqtTlQc069dxEvTivQYRJk_HwNotz_PPmmc7xG-IutSuI1lRjztP4QVZFlR1WdmGohYMOeLr6FvOcX6kfnPGdeDZZCrc3d_glyzvHiLGnCT4hEqRUmNUjWnChGZ13AjAAM-hk8YwWJ8pUkEcu3lhCXRzXrkDgPDKs3BH4pq2mgLQNjV17-tFmjllS-5o5wF87uGue8JIjeWpTMR6wx0eXjthJ44ZrohbonT9WD3HnBsq6jlRUFslHQH0S7Zg0ME7KI1HTVrq9EjTQu_nQHP8Nn3L9EFzlcXS8nlu1cg1Sih7GA6e5H7w0fzmSj91by-UOL22XBeooREmFFzrvIyuxZn9CNoNHgnEkCZCAU5Z4vna68HPfDTvhyGGwvu41g2GoXov5fAghYnbF28v0UOLJlQKm764xd9ja7LmGHRN_nZoWR3ARZeHK9K5sYAQiBUtiEo-bZjsqxlueOds1vutJh5nsdfePKJYF6-5-rTC8o0GJCmVr05gDKZKBS1MKsQU4hbvP04fiaHXZFmPeX3mNhQIoU-5AfW673E2QYzKNu_RYFyvQ3YSIEs4DJHJOS_T5Jdv96lBpg5QlnXo1wepoNj9IzN3N59pmT_2MPefqeym2WvwWhpo",
        //"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImIyNzJjOTFiNjQxY2Q5MzQxMDZkZWU0ODBkNmU4ZWM2MTI4MWViYzNjNTc0NGI1YWZjYmU4YjZjYmRkOTg5OWNlYzMwZmUwY2IwYmM3ZmVmIn0.eyJhdWQiOiIxNCIsImp0aSI6ImIyNzJjOTFiNjQxY2Q5MzQxMDZkZWU0ODBkNmU4ZWM2MTI4MWViYzNjNTc0NGI1YWZjYmU4YjZjYmRkOTg5OWNlYzMwZmUwY2IwYmM3ZmVmIiwiaWF0IjoxNjQ2NDk0Mjk1LCJuYmYiOjE2NDY0OTQyOTUsImV4cCI6MTY3ODAzMDI5NSwic3ViIjoiMSIsInNjb3BlcyI6W119.CUa33_2tY93zzlbPXkl0AEKQ2b1LqPSlp0RCmraNGU4EUFY-ufgcVVhDqtTlQc069dxEvTivQYRJk_HwNotz_PPmmc7xG-IutSuI1lRjztP4QVZFlR1WdmGohYMOeLr6FvOcX6kfnPGdeDZZCrc3d_glyzvHiLGnCT4hEqRUmNUjWnChGZ13AjAAM-hk8YwWJ8pUkEcu3lhCXRzXrkDgPDKs3BH4pq2mgLQNjV17-tFmjllS-5o5wF87uGue8JIjeWpTMR6wx0eXjthJ44ZrohbonT9WD3HnBsq6jlRUFslHQH0S7Zg0ME7KI1HTVrq9EjTQu_nQHP8Nn3L9EFzlcXS8nlu1cg1Sih7GA6e5H7w0fzmSj91by-UOL22XBeooREmFFzrvIyuxZn9CNoNHgnEkCZCAU5Z4vna68HPfDTvhyGGwvu41g2GoXov5fAghYnbF28v0UOLJlQKm764xd9ja7LmGHRN_nZoWR3ARZeHK9K5sYAQiBUtiEo-bZjsqxlueOds1vutJh5nsdfePKJYF6-5-rTC8o0GJCmVr05gDKZKBS1MKsQU4hbvP04fiaHXZFmPeX3mNhQIoU-5AfW673E2QYzKNu_RYFyvQ3YSIEs4DJHJOS_T5Jdv96lBpg5QlnXo1wepoNj9IzN3N59pmT_2MPefqeym2WvwWhpo",
      },
      body:
        msg
       //  "type": "supplier",
       //  "tax_number":tax_number,
       //  "pay_term_type":pay_term,
       //  "mobile": mobile,
       //  "landline": landline,
       //  "alternate_number": alternate_number,
       //  "address_line_1": address1,
       //  "address_line_2": address2,
       //  "city": city,
       //  "state": state,
       //  "country": country,
       //  "zip_code": zip_Or_postal,
       //  "shipping_address":shipping_address,
       // "opening_balance":opening_balance,
       //  "email":email
    //}
    );
    print("data is land name $name $landline, emSail:$email,address1 $address1, address2 $address2, city $city,mobile $mobile,pay is $pay_term,tax $tax_number,alt $alternate_number,ship $shipping_address"
        );
    print("add contact status is${response.statusCode}");
    var responseBody=json.decode(response.body);
   print("add contact respoonse is = $responseBody");
  }



}
