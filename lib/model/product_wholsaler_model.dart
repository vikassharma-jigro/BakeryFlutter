class ProductWholesalerListModel {
  bool? success;
  List<ProductWholesalerData>? data;

  ProductWholesalerListModel({this.success, this.data});

  ProductWholesalerListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <ProductWholesalerData>[];
      json['data'].forEach((v) {
        data!.add(new ProductWholesalerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductWholesalerData {
  String? productId;
  String? name;
  String? img;
  String? unit;
  int? quantityPerUnit;
  var count = 0;
  String? managerId;
  String? sellerName;
  int? price;

  ProductWholesalerData(
      {this.productId,
        this.name,
        this.img,
        this.unit,
        this.quantityPerUnit,
        this.managerId,
        this.sellerName,
        this.price});

  ProductWholesalerData.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    img = json['img'];
    unit = json['unit'];
    quantityPerUnit = json['quantityPerUnit'];
    managerId = json['managerId'];
    sellerName = json['sellerName'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['img'] = this.img;
    data['unit'] = this.unit;
    data['quantityPerUnit'] = this.quantityPerUnit;
    data['managerId'] = this.managerId;
    data['sellerName'] = this.sellerName;
    data['price'] = this.price;
    return data;
  }
}
