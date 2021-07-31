import 'dart:convert';

class HomeData{
  bool status;
  String message;
  HomeDataSmall data;

  HomeData.fromJson(Map<String ,dynamic> json){
    status = json['status'];
     message = json['message'];
     data =  json['data'] !=null ? HomeDataSmall.formJson(json['data']) : null;
  }
}
class HomeDataSmall{
  List <BannersData> banners = [];
  List <ProductsData> products = [];
  HomeDataSmall.formJson(Map<String ,dynamic> json){
    //print(json);
    if (json['banners'] != null) {
      json['banners'].forEach((element) {
        banners.add(BannersData.fromJson(element));
      });
    }
    if(json['products'] != null) {
      json['products'].forEach((element) {
        products.add(ProductsData.fromJson(element));
      });
    }
  }
}
class BannersData{
  dynamic id;
  String image;
  BannersData.fromJson(Map<String,dynamic> json){
    id = json['id'];
    image = json['image'];
  }

}
class ProductsData {

  dynamic id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  String description;
  bool inFavorite;
  bool inCart;
  ProductsData.fromJson(Map<String,dynamic> json ){
    id = json['id'];
    price = json['price'];
    oldPrice= json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFavorite = json['in_favorites'];
    inCart = json['in_cart'];

  }

}
