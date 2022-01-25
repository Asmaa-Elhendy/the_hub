
import 'package:get_storage/get_storage.dart';

class LocalStorage{
  GetStorage getStorage=GetStorage();

  saveToDisk(String  themeData)async{
  await  getStorage.write('themeName', themeData);
}

 Future get selectedtheme async{
   return await getStorage.read('themeName');
 }

}

