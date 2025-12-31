class InvoiceModel {
  bool? success;
  List<InvoiceData>? data;

  InvoiceModel({this.success, this.data});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <InvoiceData>[];
      json['data'].forEach((v) {
        data!.add(new InvoiceData.fromJson(v));
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

class InvoiceData {
  String? invoiceId;
  String? storeName;
  String? invoiceDate;
  String? paymentMode;
  String? paymentStatus;
  var amount;

  InvoiceData(
      {this.invoiceId,
        this.storeName,
        this.invoiceDate,
        this.paymentMode,
        this.paymentStatus,
        this.amount});

  InvoiceData.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoiceId'];
    storeName = json['storeName'];
    invoiceDate = json['invoiceDate'];
    paymentMode = json['paymentMode'];
    paymentStatus = json['paymentStatus'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoiceId'] = this.invoiceId;
    data['storeName'] = this.storeName;
    data['invoiceDate'] = this.invoiceDate;
    data['paymentMode'] = this.paymentMode;
    data['paymentStatus'] = this.paymentStatus;
    data['amount'] = this.amount;
    return data;
  }
}
