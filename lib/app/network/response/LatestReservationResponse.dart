class LatestReservationResponse {
  LatestReservationResponse({
      this.success, 
      this.status, 
      this.message, 
      this.data,});

  LatestReservationResponse.fromJson(dynamic json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? LatestResData.fromJson(json['data']) : null;
  }
  bool? success;
  int? status;
  String? message;
  LatestResData? data;

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

class LatestResData {
  LatestResData({
      this.payment, 
      this.reservationDetails, 
      this.vehicleDetails, 
      this.bookingDetails,});

  LatestResData.fromJson(dynamic json) {
    payment = json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    reservationDetails = json['reservationDetails'] != null ? ReservationDetails.fromJson(json['reservationDetails']) : null;
    vehicleDetails = json['vehicleDetails'] != null ? VehicleDetails.fromJson(json['vehicleDetails']) : null;
    bookingDetails = json['bookingDetails'] != null ? BookingDetails.fromJson(json['bookingDetails']) : null;
  }
  Payment? payment;
  ReservationDetails? reservationDetails;
  VehicleDetails? vehicleDetails;
  BookingDetails? bookingDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (payment != null) {
      map['payment'] = payment?.toJson();
    }
    if (reservationDetails != null) {
      map['reservationDetails'] = reservationDetails?.toJson();
    }
    if (vehicleDetails != null) {
      map['vehicleDetails'] = vehicleDetails?.toJson();
    }
    if (bookingDetails != null) {
      map['bookingDetails'] = bookingDetails?.toJson();
    }
    return map;
  }

}

class BookingDetails {
  BookingDetails({
      this.id, 
      this.customerDrivers, 
      this.status,});

  BookingDetails.fromJson(dynamic json) {
    id = json['_id'];
    if (json['customerDrivers'] != null) {
      customerDrivers = [];
      json['customerDrivers'].forEach((v) {
        customerDrivers?.add(CustomerDrivers.fromJson(v));
      });
    }
    status = json['status'];
  }
  String? id;
  List<CustomerDrivers>? customerDrivers;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (customerDrivers != null) {
      map['customerDrivers'] = customerDrivers?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
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

class VehicleDetails {
  VehicleDetails({
      this.id, 
      this.vname, 
      this.passenger, 
      this.image,});

  VehicleDetails.fromJson(dynamic json) {
    id = json['_id'];
    vname = json['vname'];
    passenger = json['passenger'];
    image = json['image'] != null ? json['image'].cast<String>() : [];
  }
  String? id;
  String? vname;
  String? passenger;
  List<String>? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['vname'] = vname;
    map['passenger'] = passenger;
    map['image'] = image;
    return map;
  }

}

class ReservationDetails {
  ReservationDetails({
      this.id, 
      this.pickup, 
      this.drop, 
      this.pickdate, 
      this.dropdate,});

  ReservationDetails.fromJson(dynamic json) {
    id = json['_id'];
    pickup = json['pickup'];
    drop = json['drop'];
    pickdate = json['pickdate'];
    dropdate = json['dropdate'];
  }
  String? id;
  String? pickup;
  String? drop;
  String? pickdate;
  String? dropdate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['pickup'] = pickup;
    map['drop'] = drop;
    map['pickdate'] = pickdate;
    map['dropdate'] = dropdate;
    return map;
  }

}

class Payment {
  Payment({
      this.id, 
      this.transactionId, 
      this.bookingId, 
      this.reservation, 
      this.userId,});

  Payment.fromJson(dynamic json) {
    id = json['_id'];
    transactionId = json['transactionId'];
    bookingId = json['bookingId'];
    reservation = json['reservation'];
    userId = json['userId'];
  }
  String? id;
  String? transactionId;
  String? bookingId;
  String? reservation;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['transactionId'] = transactionId;
    map['bookingId'] = bookingId;
    map['reservation'] = reservation;
    map['userId'] = userId;
    return map;
  }

}