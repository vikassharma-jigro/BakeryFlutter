class RetailerAccountsModel {
  bool? success;
  Summary? summary;
  List<Transactions>? transactions;

  RetailerAccountsModel({this.success, this.summary, this.transactions});

  RetailerAccountsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    summary =
    json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  int? pendingAmount;
  int? paidAmount;
  int? totalAmount;

  Summary({this.pendingAmount, this.paidAmount, this.totalAmount});

  Summary.fromJson(Map<String, dynamic> json) {
    pendingAmount = json['pendingAmount'];
    paidAmount = json['paidAmount'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pendingAmount'] = this.pendingAmount;
    data['paidAmount'] = this.paidAmount;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}

class Transactions {
  var amount;
  var orderId;
  String? paymentMode;
  String? paymentStatus;
  String? date;
  List<String>? products;

  Transactions(
      {this.amount,
        this.orderId,
        this.paymentMode,
        this.paymentStatus,
        this.date,
        this.products});

  Transactions.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    orderId = json['orderId'];
    paymentMode = json['paymentMode'];
    paymentStatus = json['paymentStatus'];
    date = json['date'];
    products = json['products'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['orderId'] = this.orderId;
    data['paymentMode'] = this.paymentMode;
    data['paymentStatus'] = this.paymentStatus;
    data['date'] = this.date;
    data['products'] = this.products;
    return data;
  }
}
