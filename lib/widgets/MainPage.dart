import 'package:flutter/material.dart';
import 'package:truyentranh_online_bloc/blocs/bloc_provider.dart';
import 'package:truyentranh_online_bloc/obj/categories.dart';
import 'package:truyentranh_online_bloc/blocs/categories_bloc.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  CategoriesBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<CategoriesBloc>(context);
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('get data from server'),
              onPressed: () {
                _bloc.getData();
              },
            ),
            RaisedButton(
              child: Text('delete all'),
              onPressed: () {
                _bloc.deleteAll();
              },
            ),
            Expanded(
              child: StreamBuilder(
                initialData: Categories.nil(),
                stream: _bloc.outPut,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Categories categories = (snapshot.data as Categories);
                    if (categories.type == Type.nodata) {
                      return Center(
                        // hasData but is empty list
                        child: Text('No data'),
                      );
                    }
                    // categories.type is loading or done
                    return Stack(
                      children: <Widget>[
                        ListView.builder(
                          itemCount: categories.categories.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(categories.categories[index].name),
                            );
                          },
                        ),
                        //if type is loading then show indicator loading, else show empty container
                        categories.type == Type.loading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Container()
                      ],
                    );
                  } else {
                    //don't hasData
                    return Center(
                      child: Text('No data'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
