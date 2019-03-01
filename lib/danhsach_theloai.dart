import 'package:truyentranh_online_bloc/theloai.dart';

class DSTheLoai{
  final List<TheLoai> theLoais;
  DSTheLoai({this.theLoais});
  factory DSTheLoai.fromJson(List<dynamic> json){
    List<TheLoai> theLoais = List<TheLoai>();
    for(int i=0;i<json.length;i++){
      Map<String,dynamic> theLoai = json[i];
      theLoais.add(TheLoai.fromJson(theLoai));
    }
    return DSTheLoai(theLoais: theLoais);
  }
}