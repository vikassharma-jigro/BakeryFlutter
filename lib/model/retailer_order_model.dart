class RetailerOrderModel {
  bool? success;
  int? count;
  List<RetailerOrderData>? data;

  RetailerOrderModel({this.success, this.count, this.data});

  RetailerOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    count = json['count'];
    if (json['data'] != null) {
      data = <RetailerOrderData>[];
      json['data'].forEach((v) {
        data!.add(new RetailerOrderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RetailerOrderData {
  String? orderId;
  String? createdAt;
  String? productName;
  int? quantity;
  var totalAmount;
  String? status;

  RetailerOrderData(
      {this.orderId,
        this.createdAt,
        this.productName,
        this.quantity,
        this.totalAmount,
        this.status});

  RetailerOrderData.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    createdAt = json['createdAt'];
    productName = json['productName'];
    quantity = json['quantity'];
    totalAmount = json['totalAmount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['createdAt'] = this.createdAt;
    data['productName'] = this.productName;
    data['quantity'] = this.quantity;
    data['totalAmount'] = this.totalAmount;
    data['status'] = this.status;
    return data;
  }
}
