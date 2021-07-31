class CartModel
{
  bool status;
   String message; // null
  Data data;

  CartModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
     message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['cart_items']) : null;
  }
}

class Data {
  //int subTotal;
  //int total;
  List<CartData> cartItems = [];

  Data.fromJson(Map<String, dynamic> json) {
    //subTotal = json['sub_total'];
    //total = json['total'];
    if(json['cart_items'] != null){
      json['cart_items'].forEach((value){
        cartItems.add(CartData.fromJson(value));
      });
    }


  }
}

class CartData {
  int id;
  int quantity;
  Product product;

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }
}

class Product {
  int id;
  dynamic price;
  dynamic oldPrice;
  int discount;
  String image;
  String name;
  String description;

  Product(
      {
        this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description
      }
      );

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}