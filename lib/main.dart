import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:truyentranh_online_bloc/MainPage.dart';
import 'package:truyentranh_online_bloc/danhsach_theloai.dart';
import 'package:truyentranh_online_bloc/theloai.dart';
import 'package:truyentranh_online_bloc/theloai_bloc.dart';
import 'dart:convert';
import 'bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          bloc: TheLoaiBloc(),
          child: MainPage()
        ),
      ),
    );
  }
}
