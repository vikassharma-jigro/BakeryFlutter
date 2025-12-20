class CheckOutModel {
  bool? success;
  DeliveryAddress? deliveryAddress;
  List<OrderSummary>? orderSummary;
  BillDetails? billDetails;

  CheckOutModel(
      {this.success,
        this.deliveryAddress,
        this.orderSummary,
        this.billDetails});

  CheckOutModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    deliveryAddress = json['deliveryAddress'] != null
        ? new DeliveryAddress.fromJson(json['deliveryAddress'])
        : null;
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
    if (this.deliveryAddress != null) {
      data['deliveryAddress'] = this.deliveryAddress!.toJson();
    }
    if (this.orderSummary != null) {
      data['orderSummary'] = this.orderSummary!.map((v) => v.toJson()).toList();
    }
    if (this.billDetails != null) {
      data['billDetails'] = this.billDetails!.toJson();
    }
    return data;
  }
}

class DeliveryAddress {
  String? sId;
  bool? isDefault;
  String? userId;
  int? iV;
  String? addressLine;
  String? city;
  String? createdAt;
  String? pincode;
  String? state;
  String? updatedAt;

  DeliveryAddress(
      {this.sId,
        this.isDefault,
        this.userId,
        this.iV,
        this.addressLine,
        this.city,
        this.createdAt,
        this.pincode,
        this.state,
        this.updatedAt});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDefault = json['isDefault'];
    userId = json['userId'];
    iV = json['__v'];
    addressLine = json['addressLine'];
    city = json['city'];
    createdAt = json['createdAt'];
    pincode = json['pincode'];
    state = json['state'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDefault'] = this.isDefault;
    data['userId'] = this.userId;
    data['__v'] = this.iV;
    data['addressLine'] = this.addressLine;
    data['city'] = this.city;
    data['createdAt'] = this.createdAt;
    data['pincode'] = this.pincode;
    data['state'] = this.state;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class OrderSummary {
  String? productId;
  String? productSource;
  String? name;
  String? img;
  int? quantity;
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
  var tax;
  var totalQuantity;
  var grandTotal;

  BillDetails({this.itemTotal, this.tax, this.totalQuantity, this.grandTotal});

  BillDetails.fromJson(Map<String, dynamic> json) {
    itemTotal = json['itemTotal'];
    tax = json['tax'];
    totalQuantity = json['totalQuantity'];
    grandTotal = json['grandTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemTotal'] = this.itemTotal;
    data['tax'] = this.tax;
    data['totalQuantity'] = this.totalQuantity;
    data['grandTotal'] = this.grandTotal;
    return data;
  }
}
