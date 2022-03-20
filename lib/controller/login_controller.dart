import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Helper {
static String errormesssage='no';

  static login(String username, String passsword) async {
    var res = await http.post(Uri.parse("https://svpos.smartqr.app/api/login"),

      headers: {
        "Accept": "application/json",
      },
      body: {
        "username": username,
        "password": passsword
      },

    );
    print(res.statusCode);
   messageFunc(res.statusCode, res.body, true);

  }


static  saveToken(String token) {
    GetStorage storage = GetStorage();
    storage.write('token', token);
    Helper.errormesssage='no';
  }

static messageFunc(int responseCode, String resbody, bool auth) {
  switch (responseCode) {
    case 200:
    case 201:
      {
        auth ? saveToken(json.decode(resbody)['token']) : Helper.errormesssage = 'no';
        print(responseCode);
      }
      break;
    case 400:
      {
        Helper.errormesssage = 'Invalid data';
        print(responseCode);
      }
      break;
    case 401:
      {
        Helper.errormesssage = 'Invalid data';
        print(responseCode);
      }
      break;
    case 403:
      {
        Helper.errormesssage = 'Invalid data';
        print(responseCode);
      }
      break;
    case 404:
      {
        Helper.errormesssage = 'You did something NOT FOUND !';
        print(responseCode);
      }
      break;
    case 500:
      {
        Helper.errormesssage = 'Server Error : we have a problem just try again later';
        print(responseCode);
      }
      break;
    default:
      {
        Helper.errormesssage =
        'We have Unknown error just connect us later or feedback $responseCode';
        print(responseCode);
      }
  }
}

static void logout() async{
  GetStorage storage =GetStorage();
  var tokenValue = storage.read("token");
  var response = await http.get(Uri.parse("https://svpos.smartqr.app/api/logout"),

    headers: {
      "Accept": "application/json",
      "Authorization":"Bearer ${tokenValue}"
    },
  );

  print("token is $tokenValue");

  var responsrbody = json.decode(response.body);
  print("status code${response.statusCode}");
  print('body is$responsrbody');

}




}