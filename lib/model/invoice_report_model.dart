class InvoiceReportModel {
  bool? success;
  InvoiceReportData? data;

  InvoiceReportModel({this.success, this.data});

  InvoiceReportModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new InvoiceReportData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class   InvoiceReportData {
  String? invoiceId;
  String? orderId;
  String? invoiceDate;
  String? dueDate;
  Retailer? retailer;
  StoreAddress? storeAddress;
  OrderSummary? orderSummary;
  List<Items>? items;
  Payment? payment;

  InvoiceReportData(
      {this.invoiceId,
        this.orderId,
        this.invoiceDate,
        this.dueDate,
        this.retailer,
        this.storeAddress,
        this.orderSummary,
        this.items,
        this.payment});

  InvoiceReportData.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoiceId'];
    orderId = json['orderId'];
    invoiceDate = json['invoiceDate'];
    dueDate = json['dueDate'];
    retailer = json['retailer'] != null
        ? new Retailer.fromJson(json['retailer'])
        : null;
    storeAddress = json['storeAddress'] != null
        ? new StoreAddress.fromJson(json['storeAddress'])
        : null;
    orderSummary = json['orderSummary'] != null
        ? new OrderSummary.fromJson(json['orderSummary'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    payment =
    json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoiceId'] = this.invoiceId;
    data['orderId'] = this.orderId;
    data['invoiceDate'] = this.invoiceDate;
    data['dueDate'] = this.dueDate;
    if (this.retailer != null) {
      data['retailer'] = this.retailer!.toJson();
    }
    if (this.storeAddress != null) {
      data['storeAddress'] = this.storeAddress!.toJson();
    }
    if (this.orderSummary != null) {
      data['orderSummary'] = this.orderSummary!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.payment != null) {
      data['payment'] = this.payment!.toJson();
    }
    return data;
  }
}

class Retailer {
  String? name;
  int? phone;
  String? email;
  String? shopName;

  Retailer({this.name, this.phone, this.email, this.shopName});

  Retailer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    shopName = json['shopName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['shopName'] = this.shopName;
    return data;
  }
}

class StoreAddress {
  String? addressLine;
  String? city;
  String? state;
  String? pincode;

  StoreAddress({this.addressLine, this.city, this.state, this.pincode});

  StoreAddress.fromJson(Map<String, dynamic> json) {
    addressLine = json['addressLine'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressLine'] = this.addressLine;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    return data;
  }
}

class OrderSummary {
  int? subTotal;
  int? discount;
  double? tax;
  double? grandTotal;

  OrderSummary({this.subTotal, this.discount, this.tax, this.grandTotal});

  OrderSummary.fromJson(Map<String, dynamic> json) {
    subTotal = json['subTotal'];
    discount = json['discount'];
    tax = json['tax'];
    grandTotal = json['grandTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subTotal'] = this.subTotal;
    data['discount'] = this.discount;
    data['tax'] = this.tax;
    data['grandTotal'] = this.grandTotal;
    return data;
  }
}

class Items {
  String? name;
  int? quantity;
  int? pricePerUnit;
  int? total;

  Items({this.name, this.quantity, this.pricePerUnit, this.total});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    pricePerUnit = json['pricePerUnit'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['pricePerUnit'] = this.pricePerUnit;
    data['total'] = this.total;
    return data;
  }
}

class Payment {
  String? method;
  String? status;
  Null? transactionId;
  Null? paymentDate;

  Payment({this.method, this.status, this.transactionId, this.paymentDate});

  Payment.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    transactionId = json['transactionId'];
    paymentDate = json['paymentDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    data['status'] = this.status;
    data['transactionId'] = this.transactionId;
    data['paymentDate'] = this.paymentDate;
    return data;
  }
}
