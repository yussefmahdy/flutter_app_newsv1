import 'dart:convert';

class SearchData{
  bool status;
  String message;
  SearchDataSmall data;

  SearchData.fromJson(Map<String ,dynamic> json){
    status = json['status'];
    message = json['message'];
    data =  json['data'] !=null ? SearchDataSmall.formJson(json['data']) : null;
  }
}
class SearchDataSmall{
  List <SearchListData> search;
  SearchDataSmall.formJson(Map<String ,dynamic> json){

    if (json['data'] != null){
      search = <SearchListData>[]; // List
      json['data'].forEach((element){
        search.add(SearchListData.fromJson(element));
      });
    }
  }
}
class SearchListData {

  dynamic id;
  dynamic price;
  dynamic oldPrice;
  String image;
  String name;
  String description;
  SearchListData.fromJson(Map<String,dynamic> json ){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    image = json['image'];
    name = json['name'];
    description = json['description'];

  }

}
