class CheckOutModel {
  bool? success;
  String? deliveryAddress;
  List<OrderSummary>? orderSummary;
  BillDetails? billDetails;

  CheckOutModel(
      {this.success,
        this.deliveryAddress,
        this.orderSummary,
        this.billDetails});

  CheckOutModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    deliveryAddress = json['deliveryAddress'];
    if (json['orderSummary'] != null) {
      orderSummary = <OrderSummary>[];
      json['orderSummary'].forEach((v) {
        orderSummary!.add(new OrderSummary.fromJson(v));
      });
    }
    billDetails = json['billDetails'] != null
        ? new BillDetails.fromJson(json['billDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['deliveryAddress'] = this.deliveryAddress;
    if (this.orderSummary != null) {
      data['orderSummary'] = this.orderSummary!.map((v) => v.toJson()).toList();
    }
    if (this.billDetails != null) {
      data['billDetails'] = this.billDetails!.toJson();
    }
    return data;
  }
}

class OrderSummary {
  String? productId;
  String? productSource;
  String? name;
  String? img;
  var quantity;
  int? price;
  int? total;

  OrderSummary(
      {this.productId,
        this.productSource,
        this.name,
        this.img,
        this.quantity,
        this.price,
        this.total});

  OrderSummary.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productSource = json['productSource'];
    name = json['name'];
    img = json['img'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productSource'] = this.productSource;
    data['name'] = this.name;
    data['img'] = this.img;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total'] = this.total;
    return data;
  }
}

class BillDetails {
  int? itemTotal;
  var deliveryCharge;
  var tax;
  var totalQuantity;
   var grandTotal;

  BillDetails(
      {this.itemTotal,
        this.deliveryCharge,
        this.tax,
        this.totalQuantity,
        this.grandTotal});

  BillDetails.fromJson(Map<String, dynamic> json) {
    itemTotal = json['itemTotal'];
    deliveryCharge = json['deliveryCharge'];
    tax = json['tax'];
    totalQuantity = json['totalQuantity'];
    grandTotal = json['grandTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemTotal'] = this.itemTotal;
    data['deliveryCharge'] = this.deliveryCharge;
    data['tax'] = this.tax;
    data['totalQuantity'] = this.totalQuantity;
    data['grandTotal'] = this.grandTotal;
    return data;
  }
}
