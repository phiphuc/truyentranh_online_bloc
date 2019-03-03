import 'package:flutter/material.dart';
import 'package:truyentranh_online_bloc/widgets/MainPage.dart';
import 'package:truyentranh_online_bloc/blocs/categories_bloc.dart';
import 'package:truyentranh_online_bloc/blocs/bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          bloc: CategoriesBloc(),
          child: MainPage()
        ),
      ),
    );
  }
}
