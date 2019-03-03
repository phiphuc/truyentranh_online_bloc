import 'package:truyentranh_online_bloc/obj/category.dart';

enum Type{nodata,loading,done}
class Categories {
  List<Category> categories;
  Type type;

  Categories({this.categories,this.type});

  factory Categories.nil(){
    return Categories(categories: List<Category>(),type: Type.nodata);
  }

  factory Categories.empty() {
    return Categories(categories: List<Category>(),type: Type.loading);
  }

  factory Categories.fromJson(List<dynamic> json) {
    List<Category> categories = List<Category>();
    for (int i = 0; i < json.length; i++) {
      Map<String, dynamic> category = json[i];
      categories.add(Category.fromJson(category));
    }
    return Categories(categories: categories,type: Type.done);
  }
}
