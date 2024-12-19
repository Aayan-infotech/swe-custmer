class HistoryResponse {
  HistoryResponse({
      this.success, 
      this.status, 
      this.message, 
      this.data,});

  HistoryResponse.fromJson(dynamic json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HistoryData.fromJson(json['data']) : null;
  }
  bool? success;
  int? status;
  String? message;
  HistoryData? data;

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

class HistoryData {
  HistoryData({
      this.total, 
      this.page, 
      this.limit, 
      this.totalPages,
      this.data,});

  HistoryData.fromJson(dynamic json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BookingData.fromJson(v));
      });
    }
  }
  int? total;
  int? page;
  int? limit;
  int? totalPages;
  List<BookingData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['page'] = page;
    map['limit'] = limit;
    map['totalPages'] = totalPages;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class BookingData {
  BookingData({
      this.amount, 
      this.bookingDetails, 
      this.reservationDetails,});

  BookingData.fromJson(dynamic json) {
    amount = json['amount'];
    bookingDetails = json['bookingDetails'] != null ? BookingDetails.fromJson(json['bookingDetails']) : null;
    reservationDetails = json['reservationDetails'] != null ? ReservationDetails.fromJson(json['reservationDetails']) : null;
  }
  String? amount;
  BookingDetails? bookingDetails;
  ReservationDetails? reservationDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    if (bookingDetails != null) {
      map['bookingDetails'] = bookingDetails?.toJson();
    }
    if (reservationDetails != null) {
      map['reservationDetails'] = reservationDetails?.toJson();
    }
    return map;
  }

}

class ReservationDetails {
  ReservationDetails({
      this.id, 
      this.pickup, 
      this.drop, 
      this.pickdate, 
      this.dropdate, 
      this.days, 
      this.vehicleId, 
      this.vehicleDetails,});

  ReservationDetails.fromJson(dynamic json) {
    id = json['_id'];
    pickup = json['pickup'];
    drop = json['drop'];
    pickdate = json['pickdate'];
    dropdate = json['dropdate'];
    days = json['days'];
    vehicleId = json['vehicleId'];
    vehicleDetails = json['vehicleDetails'] != null ? VehicleDetails.fromJson(json['vehicleDetails']) : null;
  }
  String? id;
  String? pickup;
  String? drop;
  String? pickdate;
  String? dropdate;
  String? days;
  String? vehicleId;
  VehicleDetails? vehicleDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['pickup'] = pickup;
    map['drop'] = drop;
    map['pickdate'] = pickdate;
    map['dropdate'] = dropdate;
    map['days'] = days;
    map['vehicleId'] = vehicleId;
    if (vehicleDetails != null) {
      map['vehicleDetails'] = vehicleDetails?.toJson();
    }
    return map;
  }

}

class VehicleDetails {
  VehicleDetails({
      this.id, 
      this.vname, 
      this.image,});

  VehicleDetails.fromJson(dynamic json) {
    id = json['_id'];
    vname = json['vname'];
    image = json['image'] != null ? json['image'].cast<String>() : [];
  }
  String? id;
  String? vname;
  List<String>? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['vname'] = vname;
    map['image'] = image;
    return map;
  }

}

class BookingDetails {
  BookingDetails({
      this.id, 
      this.bname, 
      this.bphone, 
      this.bemail, 
      this.bsize, 
      this.baddress, 
      this.baddressh, 
      this.driver, 
      this.status, 
      this.customerDrivers, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.paymentId,});

  BookingDetails.fromJson(dynamic json) {
    id = json['_id'];
    bname = json['bname'];
    bphone = json['bphone'];
    bemail = json['bemail'];
    bsize = json['bsize'];
    baddress = json['baddress'];
    baddressh = json['baddressh'];
    driver = json['driver'];
    status = json['status'];
    if (json['customerDrivers'] != null) {
      customerDrivers = [];
      json['customerDrivers'].forEach((v) {
        customerDrivers?.add(CustomerDrivers.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    paymentId = json['paymentId'];
  }
  String? id;
  String? bname;
  int? bphone;
  String? bemail;
  String? bsize;
  String? baddress;
  String? baddressh;
  String? driver;
  String? status;
  List<CustomerDrivers>? customerDrivers;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? paymentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['bname'] = bname;
    map['bphone'] = bphone;
    map['bemail'] = bemail;
    map['bsize'] = bsize;
    map['baddress'] = baddress;
    map['baddressh'] = baddressh;
    map['driver'] = driver;
    map['status'] = status;
    if (customerDrivers != null) {
      map['customerDrivers'] = customerDrivers?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['paymentId'] = paymentId;
    return map;
  }

}

class CustomerDrivers {
  CustomerDrivers({
      this.dphone, 
      this.demail, 
      this.dexperience, 
      this.dname, 
      this.dpolicy, 
      this.dlicense, 
      this.id,});

  CustomerDrivers.fromJson(dynamic json) {
    dphone = json['dphone'];
    demail = json['demail'];
    dexperience = json['dexperience'];
    dname = json['dname'];
    dpolicy = json['dpolicy'];
    dlicense = json['dlicense'];
    id = json['_id'];
  }
  String? dphone;
  String? demail;
  String? dexperience;
  String? dname;
  String? dpolicy;
  String? dlicense;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dphone'] = dphone;
    map['demail'] = demail;
    map['dexperience'] = dexperience;
    map['dname'] = dname;
    map['dpolicy'] = dpolicy;
    map['dlicense'] = dlicense;
    map['_id'] = id;
    return map;
  }

}