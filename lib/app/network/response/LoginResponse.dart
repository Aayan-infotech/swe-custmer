class LoginResponse {
  LoginResponse({
      this.status, 
      this.message, 
      this.data, 
      this.token,});

  LoginResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }
  int? status;
  String? message;
  Data? data;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.fullName, 
      this.email, 
      this.phoneNumber, 
      this.state, 
      this.password, 
      this.confirmPassword, 
      this.v, 
      this.image,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    state = json['state'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    v = json['__v'];
    image = json['image'];
  }
  String? id;
  String? fullName;
  String? email;
  int? phoneNumber;
  String? state;
  String? password;
  String? confirmPassword;
  int? v;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['state'] = state;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['__v'] = v;
    map['image'] = image;
    return map;
  }

}