import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:truyentranh_online_bloc/bloc_provider.dart';
import 'package:truyentranh_online_bloc/danhsach_theloai.dart';
import 'package:truyentranh_online_bloc/theloai.dart';
import 'package:truyentranh_online_bloc/theloai_bloc.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TheLoaiBloc _theLoaiBloc;

  DSTheLoai getJsonTheLoai() {
    String url = 'https://studentsocial.shipx.vn/comicvn/gettheloai.php';
    http.get(url).then((response) {
      print(response.body);
      try {
        DSTheLoai dsTheLoai = DSTheLoai.fromJson(json.decode(response.body));
        print(dsTheLoai.theLoais.length);
        _theLoaiBloc.themtoanbo(dsTheLoai);
        return dsTheLoai;
      } catch (e) {
        return null;
      }
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _theLoaiBloc = BlocProvider.of<TheLoaiBloc>(context);
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('them toan bo tu server'),
              onPressed: () {
                getJsonTheLoai();
              },
            ),
            RaisedButton(
              child: Text('xoa het'),
              onPressed: () {
                _theLoaiBloc.xoaHet();
              },
            ),
            Expanded(
              child: StreamBuilder(
                initialData: DSTheLoai(theLoais: List<TheLoai>()),
                stream: _theLoaiBloc.outPut,
                builder: (context, snapshot) {
                  DSTheLoai theloais = (snapshot.data as DSTheLoai);
                  if(theloais.theLoais.length == 0){
                    return Center(child: CircularProgressIndicator());
                  }else {
                    return ListView.builder(
                      itemCount: theloais.theLoais.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(theloais.theLoais[index].name),);
                      },);
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
