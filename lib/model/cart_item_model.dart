class CartItemModel {
  bool? success;
  String? message;
  CartData? data;

  CartItemModel({this.success, this.data,this.message});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new CartData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CartData {
  List<Items>? items;
  var totalItems;
  var totalAmount;

  CartData({this.items, this.totalItems, this.totalAmount});

  CartData.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totalItems = json['totalItems'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['totalItems'] = this.totalItems;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}

class Items {
  String? cartItemId;
  String? productId;
  String? productSource;
  String? name;
  String? img;
  var quantity;
  int? price;
  var subtotal;

  Items(
      {this.cartItemId,
        this.productId,
        this.productSource,
        this.name,
        this.img,
        this.quantity,
        this.price,
        this.subtotal});

  Items.fromJson(Map<String, dynamic> json) {
    cartItemId = json['cartItemId'];
    productId = json['productId'];
    productSource = json['productSource'];
    name = json['name'];
    img = json['img'];
    quantity = json['quantity'];
    price = json['price'];
    subtotal = json['subtotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartItemId'] = this.cartItemId;
    data['productId'] = this.productId;
    data['productSource'] = this.productSource;
    data['name'] = this.name;
    data['img'] = this.img;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['subtotal'] = this.subtotal;
    return data;
  }
}
