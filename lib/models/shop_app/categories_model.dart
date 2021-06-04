import 'dart:convert';

class CategData{
  bool status;
  String message;
  CategDataSmall data;

  CategData.fromJson(Map<String ,dynamic> json){
    status = json['status'];
    message = json['message'];
    data =  json['data'] !=null ? CategDataSmall.formJson(json['data']) : null;
  }
}
class CategDataSmall{
  List <CategListData> categories;
  CategDataSmall.formJson(Map<String ,dynamic> json){

    if (json['data'] != null){
      categories = <CategListData>[]; // List
      json['data'].forEach((element){
        categories.add(CategListData.fromJson(element));
      });
    }
  }
}
class CategListData {

  dynamic id;
  String image;
  String name;
  CategListData.fromJson(Map<String,dynamic> json ){
    id = json['id'];
    image = json['image'];
    name = json['name'];

  }

}
