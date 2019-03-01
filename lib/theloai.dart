class TheLoai{
  final String url;
  final String name;
  TheLoai({this.url,this.name});
  factory TheLoai.fromJson(Map<String,dynamic> json){
    return TheLoai(
      url: json['url'],
      name: json['name']
    );
  }
}