class AgreementPdfResponse {
  AgreementPdfResponse({
      this.success, 
      this.message, 
      this.data,});

  AgreementPdfResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? PdfData.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  PdfData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class PdfData {
  PdfData({
      this.id, 
      this.userId, 
      this.image, 
      this.v, 
      this.pdf,});

  PdfData.fromJson(dynamic json) {
    id = json['_id'];
    userId = json['userId'];
    image = json['image'];
    v = json['__v'];
    pdf = json['pdf'];
  }
  String? id;
  String? userId;
  String? image;
  int? v;
  String? pdf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['userId'] = userId;
    map['image'] = image;
    map['__v'] = v;
    map['pdf'] = pdf;
    return map;
  }

}