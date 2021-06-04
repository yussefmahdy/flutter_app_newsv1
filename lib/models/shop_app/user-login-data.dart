class UserLogin {
  bool status;
  String message;
  UserLoginData data;
  UserLogin.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message= json['message'];
    data = json['data'] != null ? UserLoginData.fromJson(json['data']) : null;
  }
}

class UserLoginData {
  dynamic id;
  String name;
  String email;
  String phone;
  String image;
  String token;
  UserLoginData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}