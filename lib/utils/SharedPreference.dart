import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{
  Future<bool> store(var key, var data)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.clear();
        var isStored = await sharedPreferences.setString(
            key, jsonEncode(data));
        isStored
            ? print("Data stored::::::::Key: "+key+":::::::::\n"+"Data::::::::::::::::\n")
            : print("Data Storing Process Failed::::::::::::Key"+key);

        return isStored;
  }

  read(var key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var value = sharedPreferences.getString(key);
    return value;
  }
}