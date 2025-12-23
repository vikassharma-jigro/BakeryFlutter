class DeliveryOrderListModel {
  bool? success;
  String? message;
  int? totalOrders;
  int? pending;
  int? dispatched;
  int? delivered;
  List<TotalPendingOrders>? totalPendingOrders;
  List<DispatchOrders>? dispatchOrders;
  List<DeliveredOrders>? deliveredOrders;

  DeliveryOrderListModel(
      {this.success,
        this.totalOrders,
        this.message,
        this.pending,
        this.dispatched,
        this.delivered,
        this.totalPendingOrders,
        this.dispatchOrders,
        this.deliveredOrders});

  DeliveryOrderListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    totalOrders = json['totalOrders'];
    pending = json['pending'];
    dispatched = json['dispatched'];
    delivered = json['delivered'];
    if (json['totalPendingOrders'] != null) {
      totalPendingOrders = <TotalPendingOrders>[];
      json['totalPendingOrders'].forEach((v) {
        totalPendingOrders!.add(new TotalPendingOrders.fromJson(v));
      });
    }
    if (json['dispatchOrders'] != null) {
      dispatchOrders = <DispatchOrders>[];
      json['dispatchOrders'].forEach((v) {
        dispatchOrders!.add(new DispatchOrders.fromJson(v));
      });
    }
    if (json['deliveredOrders'] != null) {
      deliveredOrders = <DeliveredOrders>[];
      json['deliveredOrders'].forEach((v) {
        deliveredOrders!.add(new DeliveredOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['totalOrders'] = this.totalOrders;
    data['pending'] = this.pending;
    data['dispatched'] = this.dispatched;
    data['delivered'] = this.delivered;
    if (this.totalPendingOrders != null) {
      data['totalPendingOrders'] =
          this.totalPendingOrders!.map((v) => v.toJson()).toList();
    }
    if (this.dispatchOrders != null) {
      data['dispatchOrders'] =
          this.dispatchOrders!.map((v) => v.toJson()).toList();
    }
    if (this.deliveredOrders != null) {
      data['deliveredOrders'] =
          this.deliveredOrders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalPendingOrders {
  String? orderId;
  OrderFrom? orderFrom;
  DeliveryAddress? deliveryAddress;
  String? status;

  TotalPendingOrders(
      {this.orderId, this.orderFrom, this.deliveryAddress, this.status});

  TotalPendingOrders.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderFrom = json['orderFrom'] != null
        ? new OrderFrom.fromJson(json['orderFrom'])
        : null;
    deliveryAddress = json['deliveryAddress'] != null
        ? new DeliveryAddress.fromJson(json['deliveryAddress'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    if (this.orderFrom != null) {
      data['orderFrom'] = this.orderFrom!.toJson();
    }
    if (this.deliveryAddress != null) {
      data['deliveryAddress'] = this.deliveryAddress!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}


class DispatchOrders {
  String? orderId;
  OrderFrom? orderFrom;
  DeliveryAddress? deliveryAddress;
  String? status;

  DispatchOrders(
      {this.orderId, this.orderFrom, this.deliveryAddress, this.status});

  DispatchOrders.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderFrom = json['orderFrom'] != null
        ? new OrderFrom.fromJson(json['orderFrom'])
        : null;
    deliveryAddress = json['deliveryAddress'] != null
        ? new DeliveryAddress.fromJson(json['deliveryAddress'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    if (this.orderFrom != null) {
      data['orderFrom'] = this.orderFrom!.toJson();
    }
    if (this.deliveryAddress != null) {
      data['deliveryAddress'] = this.deliveryAddress!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}



class DeliveredOrders {
  String? orderId;
  OrderFrom? orderFrom;
  DeliveryAddress? deliveryAddress;
  String? status;

  DeliveredOrders(
      {this.orderId, this.orderFrom, this.deliveryAddress, this.status});

  DeliveredOrders.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderFrom = json['orderFrom'] != null
        ? new OrderFrom.fromJson(json['orderFrom'])
        : null;
    deliveryAddress = json['deliveryAddress'] != null
        ? new DeliveryAddress.fromJson(json['deliveryAddress'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    if (this.orderFrom != null) {
      data['orderFrom'] = this.orderFrom!.toJson();
    }
    if (this.deliveryAddress != null) {
      data['deliveryAddress'] = this.deliveryAddress!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class OrderFrom {
  String? name;
  int? contact;

  OrderFrom({this.name, this.contact});

  OrderFrom.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['contact'] = this.contact;
    return data;
  }
}

class DeliveryAddress {
  String? addressLine;
  String? city;
  String? state;
  String? pincode;

  DeliveryAddress({this.addressLine, this.city, this.state, this.pincode});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
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
