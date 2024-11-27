
class UpdateProfileResponse {
  UpdateProfileResponse({
      this.success, 
      this.status, 
      this.message, 
      this.data,});

  UpdateProfileResponse.fromJson(dynamic json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  int? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
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
      this.isActive, 
      this.roles, 
      this.updatedAt, 
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
    isActive = json['isActive'];
    if (json['roles'] != null) {
      roles = [];
    }
    updatedAt = json['updatedAt'];
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
  String? isActive;
  List<dynamic>? roles;
  String? updatedAt;
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
    map['isActive'] = isActive;
    if (roles != null) {
      map['roles'] = roles?.map((v) => v.toJson()).toList();
    }
    map['updatedAt'] = updatedAt;
    map['image'] = image;
    return map;
  }

}