import 'package:truyentranh_online_bloc/danhsach_theloai.dart';
import 'package:truyentranh_online_bloc/theloai.dart';

import 'bloc_provider.dart';
import 'dart:async';

class TheLoaiBloc implements BlocBase{
  @override
  void dispose() {
    // TODO: implement dispose
  }

  //
  StreamController<DSTheLoai> _controller = StreamController<DSTheLoai>.broadcast();
  Sink<DSTheLoai> get _input => _controller.sink;
  Stream<DSTheLoai> get outPut => _controller.stream;

  DSTheLoai _dsTheLoai;

  TheLoaiBloc(){
    _dsTheLoai = DSTheLoai(theLoais: List<TheLoai>());
  }


  void them1Thang(TheLoai theLoai){
    _dsTheLoai.theLoais.add(theLoai);
    _input.add(_dsTheLoai);
  }
  void themtoanbo(DSTheLoai ds){
    _dsTheLoai.theLoais.addAll(ds.theLoais);
    _input.add(_dsTheLoai);
  }

  void xoaHet(){
    _dsTheLoai.theLoais.clear();
    _input.add(_dsTheLoai);
  }


}