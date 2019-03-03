import 'package:truyentranh_online_bloc/models/model.dart';
import 'package:truyentranh_online_bloc/obj/categories.dart';
import 'package:truyentranh_online_bloc/blocs/bloc_provider.dart';
import 'dart:async';
class CategoriesBloc implements BlocBase {
  @override
  void dispose() {
    _controller.close();
  }

  //
  StreamController<Categories> _controller =
      StreamController<Categories>.broadcast();

  Sink<Categories> get _input => _controller.sink;

  Stream<Categories> get outPut => _controller.stream;

  Categories _categories;

  CategoriesBloc() {
    _categories = Categories.nil();
  }

  void getData() async {
    //send categories with type is loading to show loading indicator
    _categories.type = Type.loading;
    _input.add(_categories);
    //loading data
    Categories categories = await Model.getData();

    if (categories == null) {
      //if get null data from server then clear categories and show 'no data' by set type is nodata
      _categories.categories.clear();
      _categories.type = Type.nodata;
      _input.add(_categories);
    } else {
      //if has data, addAll data received to categories and set type is done to show List value
      _categories.categories.addAll(categories?.categories);
      _categories.type = Type.done;
      _input.add(_categories);
    }
  }

  void deleteAll() {
    _categories.categories.clear();
    _categories.type = Type.nodata;
    _input.add(_categories);
  }
}
