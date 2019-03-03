import 'dart:convert';
import 'package:truyentranh_online_bloc/obj/categories.dart';
import 'package:http/http.dart' as http;

class Model {
  static Future<Categories> getData() async {
    String url = 'https://studentsocial.shipx.vn/comicvn/gettheloai.php';
    var response = await http.get(url);
    print(response.body);
    try {
      Categories categories = Categories.fromJson(json.decode(response.body));
      print(categories.categories.length.toString());
      return categories;
    } catch (e) {
      print('empty');
      return null;
    }
  }
}
