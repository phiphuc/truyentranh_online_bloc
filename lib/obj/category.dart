class Category{
  final String url;
  final String name;
  Category({this.url,this.name});
  factory Category.fromJson(Map<String,dynamic> json){
    return Category(
      url: json['url'],
      name: json['name']
    );
  }
}